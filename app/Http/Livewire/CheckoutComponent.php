<?php

namespace App\Http\Livewire;

use App\Mail\OrderMail;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Shipping;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Cart;
use Exception;
use Illuminate\Support\Facades\Mail;
use Stripe;

class CheckoutComponent extends Component
{
    public $shipping_to_different;
    public $firstname;
    public $lastname;
    public $mobile;
    public $email;
    public $line1;
    public $line2;
    public $city;
    public $province;
    public $country;
    public $zipcode;

    public $s_firstname;
    public $s_lastname;
    public $s_mobile;
    public $s_email;
    public $s_line1;
    public $s_line2;
    public $s_city;
    public $s_province;
    public $s_country;
    public $s_zipcode;

    public $thankyou;

    public $paymentmode;

    public $card_no;
    public $exp_month;
    public $exp_year;
    public $cvc;

    public function update($field)
    {
        $this->validateOnly($field,[
            'firstname' => 'required',
            'lastname' => 'required',
            'mobile' => 'required|numeric',
            'email' => 'required|email',
            'line1' => 'required',
            'line2' => 'required',
            'city' => 'required',
            'province' => 'required',
            'country' => 'required',
            'zipcode' => 'required',
            'paymentmode' => 'required'
        ]);

        $this->validateOnly($field,[
            's_firstname' => 'required',
            's_lastname' => 'required',
            's_mobile' => 'required|numeric',
            's_email' => 'required|email',
            's_line1' => 'required',
            's_line2' => 'required',
            's_city' => 'required',
            's_province' => 'required',
            's_country' => 'required',
            's_zipcode' => 'required'
        ]);

        $this->validateOnly($field,[
            'card_no' => 'required',
            'exp_month' => 'required',
            'exp_year' => 'required',
            'cvc' => 'required',
        ]);
    }
    public function placeOrder()
    {
        $this->validate([
            'firstname' => 'required',
            'lastname' => 'required',
            'mobile' => 'required|numeric',
            'email' => 'required|email',
            'line1' => 'required',
            'line2' => 'required',
            'city' => 'required',
            'province' => 'required',
            'country' => 'required',
            'zipcode' => 'required',
            'paymentmode' => 'required'
        ]);

        if($this->paymentmode == 'card')
        {
            $this->validate([
                'card_no' => 'required',
                'exp_month' => 'required',
                'exp_year' => 'required',
                'cvc' => 'required',
            ]);
        }
        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->subtotal = session()->get('checkout')['subtotal'];
        $order->discount = session()->get('checkout')['discount'];
        $order->tax = session()->get('checkout')['tax'];
        $order->total = session()->get('checkout')['total'];
        $order->firstname = $this->firstname;
        $order->lastname = $this->lastname;
        $order->mobile = $this->mobile;
        $order->email = $this->email;
        $order->line1 = $this->line1;
        $order->line2 = $this->line2;
        $order->city = $this->city;
        $order->province = $this->province;
        $order->country = $this->country;
        $order->zipcode = $this->zipcode;
        $order->status = 'ordered';
        $order->is_shipping_different = $this->shipping_to_different ? 1:0;
        $order->save();

        foreach(Cart::instance('cart')->content() as $item)
        {
            $orderItem = new OrderItem();
            $orderItem->product_id = $item->id;
            $orderItem->order_id = $order->id;
            $orderItem->price = $item->price;
            $orderItem->quantity = $item->qty;
            $orderItem->save();
        }

        if($this->shipping_to_different)
        {
            $this->validate([
                's_firstname' => 'required',
                's_lastname' => 'required',
                's_mobile' => 'required|numeric',
                's_email' => 'required|email',
                's_line1' => 'required',
                's_line2' => 'required',
                's_city' => 'required',
                's_province' => 'required',
                's_country' => 'required',
                's_zipcode' => 'required'
            ]);

            $shipping = new Shipping();
            $shipping->order_id = $order->id;
            $shipping->firstname = $this->s_firstname;
            $shipping->lastname = $this->s_lastname;
            $shipping->mobile = $this->s_mobile;
            $shipping->email = $this->s_email;
            $shipping->line1 = $this->s_line1;
            $shipping->line2 = $this->s_line2;
            $shipping->city = $this->s_city;
            $shipping->province = $this->s_province;
            $shipping->country = $this->s_country;
            $shipping->zipcode = $this->s_zipcode;
            $shipping->save();
        }
         
        if($this->paymentmode=='cod')
        {
            $this->makeTransaction($order->id,'pending');
            $this->resetCard();
        }else if($this->paymentmode == 'card')
        {
            $stripe = Stripe::make(env('STRIPE_KEY'));
            try {
                $token = $stripe->tokens()->create(
                    [
                        'Card' => [
                            'number' => $this->card_no,
                            'exp-month' => $this->exp_month,
                            'exp-year' => $this->exp_year,
                            'cvc' => $this->cvc,
                        ]
                    ]
                );
                if (!isset($token['id'])) {
                    # code...
                    session()->flash('stripe_error','The stripe token was not generated correctly!');
                    $this->thankyou = 0;
                }

                $customer = $stripe->customers()->create([
                   'name' => $this->firstname.' '.$this->lastname,
                   'email' => $this->email,
                   'phone' => $this->mobile,
                   'address' => [
                       'line1' => $this->line1,
                       'pastal_code' => $this->zipcode,
                       'city' => $this->city,
                       'state' => $this->province,
                       'country' => $this->country
                   ],
                   'shippng' => [
                    'name' => $this->firstname.' '.$this->lastname,
                    'line1' => $this->line1,
                    'pastal_code' => $this->zipcode,
                    'city' => $this->city,
                    'state' => $this->province,
                    'country' => $this->country
                   ],
                   'source' => $token['id'],
                ]);

                $charge = $tripe->charges()->create([
                    'customer' => $customer['id'],
                    'currency' => 'USD',
                    'amount' => session()->get('checkout')['total'],
                    'description' => 'Payment for order '.$order->id,
                ]);

                if ($charge['status'] == 'succeeded') {
                    # code...
                    $this->makeTransaction($order->id,'approved');
                    $this->resetCard();
                }else
                {
                    $this->thankyou = 0;
                    session()->flash('stripe_error','Error in Transaction!');
                }
            } catch (Exception $e) {
                //throw $th;
                session()->flash('stripe_error',$e->getMessage());
                $this->thankyou = 0;
            }
            
        }
        
        $this->sendOrderEmailConfirmation($order);
        
    }

    public function resetCard()
    {
        $this->thankyou = 1;
        Cart::instance('cart')->destroy();
        session()->forget('checkout');
    }
    public function makeTransaction($order_id,$status)
    {
            $transaction = new Transaction();
            $transaction->user_id = Auth::user()->id;
            $transaction->order_id = $order_id;
            $transaction->mode = $this->paymentmode;
            $transaction->status = $status;
            $transaction->save();
    }
    public function verifyForCheckout()
    {

        if (!Auth::check()) {
            return redirect()->route('login');
        }else if ($this->thankyou) {
            return redirect()->route('thankyou');
        }else if (!session()->has('checkout')) {
            return redirect()->route('product.cart');
        }
    }
    
    public function sendOrderEmailConfirmation($order)
    {
        Mail::to($order->email)->send(new OrderMail($order));
    }
    public function render()
    {
        $this->verifyForCheckout();
        return view('livewire.checkout-component')->layout('layouts.base');
    }
}
