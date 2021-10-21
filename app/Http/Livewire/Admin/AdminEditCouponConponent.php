<?php

namespace App\Http\Livewire\Admin;

use App\Models\Coupon;
use Livewire\Component;
use Illuminate\Validation\Rule;

class AdminEditCouponConponent extends Component
{
    public $code;
    public $value;
    public $type;
    public $cart_value;
    public $coupon_id;
    public $expiry_date;
    public function mount($coupon_id)
    {
        $coupon = Coupon::find($coupon_id);
        $this->code = $coupon->code;
        $this->value = $coupon->value;
        $this->type = $coupon->type;
        $this->cart_value = $coupon->cart_value;
        $this->coupon_id = $coupon->id;
        $this->expiry_date = $coupon->expiry_date;

    }
    public function update($fields)
    {
        $this->validateOnly($fields,[
            'code' => [
                        'required',
                        Rule::unique('Coupons')->ignore($this->coupon_id)
                     ],
            'type' => 'required',
            'value' => 'required|numeric',
            'cart_value' => 'required|numeric',
            'expiry_date' => 'required'
        ]);
    }
    public function updateCoupon()
    {
        $this->validate([
            'code' => [
                            'required',
                            Rule::unique('Coupons')->ignore($this->coupon_id)
                        ],
            'type' => 'required',
            'value' => 'required|numeric',
            'cart_value' => 'required|numeric',
            'expiry_date' => 'required'
        ]);
        $coupon = Coupon::find($this->coupon_id);
        $coupon->code = $this->code;
        $coupon->value = $this->value;
        $coupon->type = $this->type;
        $coupon->cart_value = $this->cart_value;
        $coupon->expiry_date = $this->expiry_date;
        $coupon->save();
        session()->flash('message','Coupon has been updated successfully!');
    }
    public function render()
    {
        return view('livewire.admin.admin-edit-coupon-conponent')->layout('layouts.base');
    }
}
