<?php

namespace App\Http\Livewire\Admin;

use App\Models\Setting;
use Livewire\Component;

class AdminSettingComponent extends Component
{
    public $email;
    public $phone;
    public $phone2;
    public $address;
    public $map;
    public $twiter;
    public $pinterest;
    public $facebook;
    public $youtube;
    public $instagram;
    public function mount()
    {
        $sessting = Setting::find(1);
        if($sessting)
        {
            $this->email = $sessting->email;
            $this->phone = $sessting->phone;
            $this->phone2 = $sessting->phone2;
            $this->address = $sessting->address;
            $this->map = $sessting->map;
            $this->twiter = $sessting->twiter;
            $this->pinterest = $sessting->pinterest;
            $this->facebook = $sessting->facebook;
            $this->youtube = $sessting->youtube;
            $this->instagram = $sessting->instagram;
        }
    }
    
    public function update($fields)
    {
        $this->validateOnly($fields,[
            'email' => 'required|email',
            'phone' => 'required',
            'phone2' => 'required',
            'address' => 'required',
            'map' => 'required',
            'twiter' => 'required',
            'pinterest' => 'required',
            'facebook' => 'required',
            'youtube' => 'required',
            'instagram' => 'required'
        ]);
    }
    public function saveSetting()
    {
        $this->validate([
            'email' => 'required|email',
            'phone' => 'required',
            'phone2' => 'required',
            'address' => 'required',
            'map' => 'required',
            'twiter' => 'required',
            'pinterest' => 'required',
            'facebook' => 'required',
            'youtube' => 'required',
            'instagram' => 'required'

        ]);

        $sessting = Setting::find(1);
        if(!$sessting)
        {
            $sessting = new Setting();
        }

        $sessting->email = $this->email;
        $sessting->phone = $this->phone;
        $sessting->phone2 = $this->phone2;
        $sessting->address = $this->address;
        $sessting->map = $this->map;
        $sessting->twiter = $this->twiter;
        $sessting->pinterest = $this->pinterest;
        $sessting->facebook = $this->facebook;
        $sessting->youtube = $this->youtube;
        $sessting->instagram = $this->instagram;
        $sessting->save();
        session()->flash('setting_message','Setting has been saved successful!');
    }
    public function render()
    {
        return view('livewire.admin.admin-setting-component')->layout('layouts.base');
    }
}
