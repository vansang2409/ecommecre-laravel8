<?php

namespace App\Http\Livewire\User;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class UserChangePasswordComponent extends Component
{
    public $currentpassword;
    public $newpassword;
    public $confirmpassword;


    public function update($fields)
    {
        $this->validateOnly($fields,[
            'currentpassword'=>'required',
            'newpassword' =>'required|min:8|different:currentpassword'
        ]);
    }

    public function changePassword()
    {
        $this->validate([
            'currentpassword'=>'required',
            'newpassword' =>'required|min:8|different:currentpassword'
        ]);

        if(Hash::check($this->currentpassword,Auth::user()->password))
        {
            if($this->newpassword==$this->confirmpassword)
            {   
                $user = User::findorfail(Auth::user()->id);
                $user->password = Hash::make($this->newpassword);
                $user->save();
                session()->flash('success_message','Password has been changed successfull!');
            }else
            {
                session()->flash('error_message','Password Confirmation does not match!');
            }

        }
        else
        {
            session()->flash('error_message','Password does not match!');
        }
    }
    public function render()
    {
        return view('livewire.user.user-change-password-component')->layout('layouts.base');
    }
}
