<?php

namespace App\Http\Livewire;

use App\Models\Coupon;
use Carbon\Carbon;
use Livewire\Component;
use Cart;
use NumberFormatter;
use Illuminate\Support\Facades\Auth;
class CartComponent extends Component
{
    public $haveCouponCode;
    public $couponCode;
    public $subtotalAfterDiscount;
    public $taxAfterDiscount;
    public $discount;
    public $totalAfterDiscount;
    public $subtotal;
    private $format;
    public function mount(){
        
        $this->format = numfmt_create( 'en_EN', NumberFormatter::DECIMAL );
        $this->subtotal = numfmt_parse($this->format,Cart::instance('cart')->subtotal());
    }
    public function increaseQuantity($rowId)
    {
       $product=Cart::instance('cart')->get($rowId);
       $qty=$product->qty + 1;
       Cart::instance('cart')->update($rowId,$qty);
       //$this->subtotal = numfmt_parse($this->format,Cart::instance('cart')->subtotal());
       $this->emitTo('cart-count-component','refreshComponent');
    }
    public function decreaseQuantity($rowId)
    {
       $product=Cart::instance('cart')->get($rowId);
       $qty=$product->qty - 1;
       Cart::instance('cart')->update($rowId,$qty);
       $this->emitTo('cart-count-component','refreshComponent');
    }
    public function  destroy($rowId)
    {
        Cart::instance('cart')->remove($rowId);
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('success_message','Item has been remove');

    }
    public function  destroyAll()
    {
        Cart::instance('cart')->destroy();
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('success_message','All item has been remove');

    }
    public function switchToSaveForLater($rowId)
    {
        $item = Cart::instance('cart')->get($rowId);
        Cart::instance('cart')->remove($rowId);
        Cart::instance('saveForLater')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('success_message','Item has been saved for later successfully!');
    }

    public function moveToCart($rowId)
    {
        $item = Cart::instance('saveForLater')->get($rowId);
        Cart::instance('saveForLater')->remove($rowId);
        Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
        $this->emitTo('cart-count-component','refreshComponent');
        session()->flash('save_message','Item has been saved for later successfully!');
    }

    public function deleteSaveForLater($rowId)
    {
        Cart::instance('saveForLater')->remove($rowId);
        session()->flash('save_message','Item has been removed successfully!');
    }
    public function applyCouponCode()
    {
        $this->format = numfmt_create( 'en_EN', NumberFormatter::DECIMAL );
        $this->subtotal = numfmt_parse($this->format,Cart::instance('cart')->subtotal());
        $coupon = Coupon::where('code',$this->couponCode)->where('expiry_date','>=',Carbon::today())->where('cart_value','<=',$this->subtotal)->first();
        if(!$coupon)
        {
            session()->flash('coupon_message','Coupon code not invalid!');
            return;
        }
        //session()->flash('coupon_message',$this->subtotal);
        session()->put('coupon',[
           'code' => $coupon->code,
           'type' => $coupon->type,
           'value' => $coupon->value,
           'cart_value' => $coupon->cart_value,
            ]
        );
    }
    public function calculateDiscounts()
    {
        if(session()->has('coupon'))
        {
            if(session()->get('coupon')['type'] =='fixed')
            {
                $this->discount = session()->get('coupon')['value'];
            }else
            {
                $this->discount = (Cart::instance('cart')->subtotal()*session()->get('coupon')['value'])/100;
            }

            $this->subtotalAfterDiscount = $this->subtotal - $this->discount;
            $this->taxAfterDiscount = ($this->subtotalAfterDiscount * config('cart.tax'))/100;
            $this->totalAfterDiscount = $this->subtotalAfterDiscount + $this->taxAfterDiscount;
               
        }
    }
    public function removeCoupon()
    {
        session()->forget('coupon');
    }

    public function checkout()
    {
        if(Auth::check()) {
            # code...
            return redirect()->route('checkout');
        }else
        {
            return redirect()->route('login');
        }         
    }
    
    public function setAmountForCheckout()
    {
        if (!Cart::instance('cart')->count() > 0) {
            session()->forget('checkout');
            return;
        }
        if (session()->has('coupon')) {
            # code...

            session()->put('checkout',[
                'discount' => $this->discount,
                'subtotal' => $this->subtotalAfterDiscount,
                'tax' => $this->taxAfterDiscount,
                'total' => $this->totalAfterDiscount
            ]);
        }else
        {
            session()->put('checkout',[
                'discount' => 0,
                'subtotal' => Cart::instance('cart')->subtotal(),
                'tax' => Cart::instance('cart')->tax(),
                'total' => Cart::instance('cart')->total()
            ]);
        }
    }

    public function render()
    {

        if(session()->has('coupon'))
        {
            $this->format = numfmt_create( 'en_EN', NumberFormatter::DECIMAL );
            $this->subtotal = numfmt_parse($this->format,Cart::instance('cart')->subtotal());
            if ($this->subtotal < session()->get('coupon')['value']) {
                
                session()->forget('coupon');
                //$this->calculateDiscounts();
            }else{
                $this->calculateDiscounts();
            }
        }
        $this->setAmountForCheckout();
        return view('livewire.cart-component')->layout('layouts.base');
    }
}
