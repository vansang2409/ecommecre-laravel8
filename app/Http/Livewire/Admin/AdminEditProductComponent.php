<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\Product;
use Livewire\Component;
use Livewire\WithFileUploads;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class AdminEditProductComponent extends Component
{
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
    public $newimage;
    public $product_id;
    public $newimages;
    public $images;
    

    public function mount($product_slug){
        
        $this->slug=$product_slug;
        $product=Product::where('slug',$product_slug)->first();
        if(!$product)
        {
            return redirect()->route('shop');
        }

        $this->name=$product->name;
        $this->short_description=$product->short_description;
        $this->description=$product->description;
        $this->regular_price=$product->regular_price;
        $this->sale_price=$product->sale_price;
        $this->SKU=$product->SKU;
        $this->stock_status=$product->stock_status;
        $this->image=$product->image;
        $this->featured=$product->featured;
        $this->category_id=$product->category_id;
        $this->quantity=$product->quantity;
        $this->product_id=$product->id;
        $this->images = $product->images;
    }
    public function generateSlug(){
        $this->slug=Str::slug($this->name);
    }
    use WithFileUploads;
    protected function rules()
    {
        return [
            'name'=>'required',
            'slug'=>[
                'required',
                Rule::unique('Products')->ignore($this->product_id)
             ],
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'numeric',
            'SKU'=>'required',
            'stock_status'=>'required',
            'quantity'=>'required|numeric',
            'category_id'=>'required'
        ];
    }
    public function update($fields)
    {
       $this->validateOnly($fields,$this->rules());
    }

    public function updateProduct()
    {
         
        $this->validate($this->rules());

        $product=Product::find($this->product_id);
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

        if($this->newimage){
            unlink('assets/images/products/'.$product->image);
            $imageName=Carbon::now()->timestamp.'.'.$this->newimage->extension();
            $this->newimage->storeAs('products',$imageName);
            $product->image=$imageName;
        }

        if($this->newimages){
            $imagesName = "";
            $imgs = explode(',',$product->images);
            foreach($imgs as $img)
            {
                if($img)
                {
                    unlink('assets/images/products/'.$img);
                }
            }
            foreach($this->newimages as $key => $image)
            {
                $imgsName=Carbon::now()->timestamp.$key.'.'.$image->extension();
                $image->storeAs('products',$imgsName);
                $imagesName = $imagesName.','.$imgsName;
            }
            $product->images = $imagesName;
        }
        
        $product->save();
        session()->flash('message','Product has been updated successfuly!');
    }
    public function render()
    {
        $categories=Category::all();
        return view('livewire.admin.admin-edit-product-component',['categories'=>$categories])->layout('layouts.base');
    }
}
