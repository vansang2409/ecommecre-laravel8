<div>
 <div class="container" style="padding: 30px 0;">
   <div class="row">
       <div class="col-md-12">
           <div class="panel panel-default">
              <div class="panel-heading">
                  <div class="row">
                      <div class="col-md-6">
                          Edit Slider
                      </div>
                      <div class="col-md-6">
                          <a href="{{route('admin.homeslider')}}" class="btn btn-success pull-right">All SLiders</a>
                      </div>
                  </div>
              </div>
              <div class="panel-body">
                  @if(Session::has('message'))
                     <div class="alert alert-success" role="alert"> {{Session::get('message')}}</div>
                  @endif
                     <form class="form form-horizontal" wire:submit.prevent="updateSlider">
                         <div class="form-group">
                             <label for="" class="col-md-4 control-label">Title</label>
                             <div class="col-md-4">
                                <input type="text" class="form-control input-md" placeholder="Title" wire:model="title" />
                             </div>
                         </div>
                         <div class="form-group">
                             <label for="" class="col-md-4 control-label">Subtitle</label>
                             <div class="col-md-4">
                                <input type="text" class="form-control input-md" placeholder="Subtitle" wire:model="subtitle" />
                             </div>
                         </div>
                         <div class="form-group">
                             <label for="" class="col-md-4 control-label">Price</label>
                             <div class="col-md-4">
                                <input type="text" class="form-control input-md" placeholder="Price" wire:model="price" />
                             </div>
                         </div>
                         <div class="form-group">
                             <label for="" class="col-md-4 control-label">Link</label>
                             <div class="col-md-4">
                                <input type="text" class="form-control input-md" placeholder="Link" wire:model="link" />
                             </div>
                         </div>
                         <div class="form-group">
                             <label for="image" class="col-md-4 control-label">Image</label>
                              <div class="col-md-4">
                                  <input type="file" class="col-md-4 input-file" wire:model='newimage'/>
                              </div>
                              @if($newimage)
                                 <img src="{{$newimage->TemporaryUrl()}}"  width="150px" />
                              @else
                                <img src="{{asset('assets/images/sliders')}}/{{$image}}" alt="" width="150px">
                              @endif
                         </div>
                         <div class="form-group">
                             <label for="status" class="col-md-4 control-label">Status</label>
                             <div class="col-md-4">
                                 <select class="form-control" wire:model="status">
                                     <option value="0">Inactive</option>
                                     <option value="1">Active</option>
                                 </select>
                             </div>
                         </div>
                         <div class="form-group">
                             <label for="" class="col-md-4 control-label"></label>
                             <div class="col-md-4">
                                 <button class="btn btn-primary">Submit</button>
                             </div>
                         </div>
                     </form>
              </div>
           </div>
       </div>
   </div>
 </div>
</div>
