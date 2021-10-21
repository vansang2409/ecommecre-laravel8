<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\Product;
use Livewire\Component;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;
use Livewire\WithFileUploads;
class AdminAddProductComponent extends Component
{
    //public $categories;
    public $name;
    public $slug;
    public $short_description;
    public $description;
    public $regular_price;
    public $sale_price;
    public $SKU;
    public $stock_status;
    public $image;
    public $featured;
    public $category_id;
    public $quantity;
    public $images;

    use WithFileUploads;
    public function mount(){
        $this->stock_status='instock';
        $this->featured=0;
    }

    public function generateSlug()
    {
         $this->slug=Str::slug($this->name);
    }
   

    public function update($field)
    {
        $this->validateOnly($field,[
            'name'=>'required',
            'slug'=>'required|unique:products',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'numeric',
            'SKU'=>'required',
            'stock_status'=>'required',
            'image'=>'required|mimes:jpeg,png',
            'quantity'=>'required|numeric',
            'category_id'=>'required',
        ]);
    }

    public function addProduct()
    {
        $this->validate([
            'name'=>'required',
            'slug'=>'required|unique:products',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'numeric',
            'SKU'=>'required',
            'stock_status'=>'required',
            'image'=>'required|mimes:jpeg,png',
            'quantity'=>'required|numeric',
            'category_id'=>'required',
        ]);

        $product= new Product();
        $product->name=$this->name;
        $product->slug=$this->slug;
        $product->short_description=$this->short_description;
        $product->description=$this->description;;
        $product->quantity=$this->quantity;
        $product->regular_price=$this->regular_price;
        $product->sale_price=$this->sale_price;
        $product->SKU=$this->SKU;
        $product->stock_status=$this->stock_status;
        $product->featured=$this->featured;
        $product->category_id=$this->category_id;
        $imageName=Carbon::now()->timestamp.'.'.$this->image->extension();
        $this->image->storeAs('products',$imageName);
        $product->image=$imageName;

        if($this->images)
        {
            $imagesName = "";
            foreach($this->images as $key => $image)
            {
                $imgName=Carbon::now()->timestamp.$key.'.'.$image->extension();
                $image->storeAs('products',$imgName);
                $imagesName = $imagesName .",". $imgName;
            }
            $product->images = $imagesName;
            
        }
        $product->save();
        session()->flash('message','Product has been created successfuly!');
    }
    public function render()
    {
        $categories=Category::all();
        return view('livewire.admin.admin-add-product-component',['categories'=>$categories])->layout('layouts.base');
    }
}
