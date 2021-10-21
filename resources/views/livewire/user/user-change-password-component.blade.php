<div>
    <div class="container" style="padding: 30px 0;">
       <div class="row">
           <div class="col-md-12">
               <div class="panel panel-default">
                   <div class="panel-heading">
                       Change Password
                   </div>
                   <div class="panel-body">
                       @if(Session::has('success_message'))
                             <p class="alert alert-success" role="alert">{{Session::get('success_message')}}</p>
                       @endif
                       @if(Session::has('error_message'))
                             <p class="alert alert-danger" role="alert">{{Session::get('error_message')}}</p>
                       @endif
                       <form  class="form-horizontal" wire:submit.prevent="changePassword" >
                           <div class="form-group">
                               <label for="" class="col-md-4 control-label">Current Password</label>
                               <div class="col-md-4">
                                   <input type="password" placeholder="Current Password"  class="form-control input-md" name="currentpassword" wire:model="currentpassword">
                                 @error('currentpassword') <p class="text-danger">{{$message}}</p>@enderror
                                </div>
                           </div>
                           <div class="form-group">
                               <label for="" class="col-md-4 control-label">New Password</label>
                               <div class="col-md-4">
                                   <input type="password" placeholder="New Password"  class="form-control input-md" name="newpassword" wire:model="newpassword">
                                   @error('newpassword') <p class="text-danger">{{$message}}</p>@enderror
                                </div>
                           </div>
                           <div class="form-group">
                               <label for="" class="col-md-4 control-label">Confirm Password</label>
                               <div class="col-md-4">
                                   <input type="password" placeholder="Confirm Password"  class="form-control input-md" name="confirmpassword" wire:model="confirmpassword">
                                   @error('confirmpassword') <p class="text-danger">{{$message}}</p>@enderror
                                </div>
                           </div>
                           <div class="form-group">
                               <div class="col-md-4">
                                   <button type="submit"   class="btn btn-success" >Submit</button>
                               </div>
                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </div>
    </div>
</div>
