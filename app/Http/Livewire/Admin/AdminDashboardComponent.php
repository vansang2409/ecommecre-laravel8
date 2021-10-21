<?php

namespace App\Http\Livewire\Admin;

use App\Models\Order;
use Illuminate\Support\Carbon;
use Livewire\Component;

class AdminDashboardComponent extends Component
{
    public function render()
    {
        $orders = Order::orderby('created_at','DESC')->get()->take(10);
        $totalSale = Order::where('status','delivered')->count();
        $totalRevenue = Order::where('status','delivered')->sum('total');
        $todaySale = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->count();
        $todayRevenue = Order::where('status','delivered')->whereDate('created_at',Carbon::today())->sum('total');
        return view('livewire.admin.admin-dashboard-component',[
            'orders' => $orders,
            'totalSale' => $totalSale,
            'totalRevenue' => $totalRevenue,
            'todaySale' => $todaySale,
            'todayRevenue' => $todayRevenue
        ])->layout('layouts.base');
    }
}
