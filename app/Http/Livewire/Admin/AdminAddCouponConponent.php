<?php

namespace App\Http\Livewire\Admin;

use App\Models\Coupon;
use Livewire\Component;

class AdminAddCouponConponent extends Component
{
    public $code;
    public $value;
    public $type;
    public $cart_value;
    public $expiry_date;

    public function update($fields)
    {
        $this->validateOnly($fields,[
            'code' => 'required|unique:coupons',
            'type' => 'required',
            'value' => 'required|numeric',
            'cart_value' => 'required|numeric',
            'expiry_date' => 'required'

        ]);
    }
    public function storeCoupon()
    {
        $this->validate([
            'code' => 'required|unique:coupons',
            'type' => 'required',
            'value' => 'required|numeric',
            'cart_value' => 'required|numeric',
            'expiry_date' => 'required'
        ]);
        $coupon = new Coupon();
        $coupon->code = $this->code;
        $coupon->value = $this->value;
        $coupon->type = $this->type;
        $coupon->cart_value = $this->cart_value;
        $coupon->expiry_date = $this->expiry_date;
        $coupon->save();
        session()->flash('message','Coupon has been created successfully!');
    }
    public function render()
    {
        return view('livewire.admin.admin-add-coupon-conponent')->layout('layouts.base');
    }
}
