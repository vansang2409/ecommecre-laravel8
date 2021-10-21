<?php

namespace App\Http\Livewire\Admin;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;
class AdminProductComponent extends Component
{
    use WithPagination;
    public function deleteProduct($id)
    {
        $product=Product::find($id);
        if($product->image)
        {
            unlink('assets/images/products/'.$product->image);
        }

        if($product->images)
        {
            $imgs = explode(',',$product->images);
            foreach($imgs as $img)
            {
                if($img)
                {
                    unlink('assets/images/products/'.$img);
                }
            }
        }
        $product->delete();
        session()->flash('message','Product has been deleted successfully!');
    }
    public function render()
    {
        $products=Product::paginate(10);
        return view('livewire.admin.admin-product-component',['products'=>$products])->layout('layouts.base');
    }
}
