<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use Illuminate\Support\Str;
use App\Models\Category;
use Illuminate\Validation\Rule;
class AdminEditCategoryComponent extends Component
{
    public $category_slug;
    public $name;
    public $category_id;
    public $slug;

    public function mount($category_slug){

        $this->category_slug = $category_slug;
        $category = Category::where('slug',$category_slug)->first();
        $this->category_id = $category->id;
        $this->name = $category->name;
        $this->slug = $category->slug;
    }
    public function generateslug(){
        $this->slug = Str::slug($this->name);
    }
    protected function rules()
    {
        return [
            'name' => 'required',
            'slug' => [
                        'required',
                        Rule::unique('Categories')->ignore($this->category_id)
                      ] ,
        ];
    }
    public function update($fields)
    {
       $this->validateOnly($fields,$this->rules());
    }

    public function updateCategory(){

        $this->validate($this->rules());
        $category = Category::find($this->category_id);
        $category->name = $this->name;
        $category->slug = $this->slug;
        $category->save();
        session()->flash('message','Category has been updated successfully!');
    }
    public function render()
    {
        

          return view('livewire.admin.admin-edit-category-component')->layout('layouts.base');

         
    }
}
