<?php

namespace App\Http\Livewire;

use App\Models\Category;
use App\Models\HomeCategories;
use App\Models\HomeSlider;
use App\Models\Product;
use App\Models\Sale;
use Livewire\Component;

class HomeComponent extends Component
{
    public function render()
    {
        $sliders=HomeSlider::where('status',1)->get();
        $productsLatest=Product::orderBy('created_at','DESC')->get()->take(8);
        $homecategory = HomeCategories::find(1);
        $cats = explode(',',$homecategory->sel_categories);
        $categories = Category::whereIn('id',$cats)->get();
        $no_of_products = $homecategory->no_of_products; 
        $productsSale = Product::where('sale_price','>',0)->inRandomOrder()->get()->take(8);
        $sale = Sale::find(1);
        return view('livewire.home-component',['sliders'=>$sliders,'productsLatest'=>$productsLatest,'categories'=>$categories,'numberofproducts'=>$no_of_products,'productsSale'=>$productsSale,'sale'=>$sale])->layout('layouts.base');
    }
}