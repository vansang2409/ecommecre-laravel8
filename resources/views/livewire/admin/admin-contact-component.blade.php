<div>
    <div class="container" style="padding: 30px 0px;">
       <div class="row">
           <div class="col-md-12">
               <Style>
                   nav svg{
                       height: 20px;
                   }
                   nav.hidden{
                       display: block !important;
                   }
               </Style>
               <div class="panel panel-default">
                   <div class="panel-heading">
                       Contact Message
                   </div>
                   <div class="panel-body">
                       <table class="table table-striped">
                           <thead>
                                <th>#</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Comment</th>
                           </thead>
                           <tbody>
                                 @php
                                     $row=1;
                                 @endphp
                                 @foreach($contacts as $contact)
                                    <tr>
                                        <td>{{ $row++ }}</td>
                                        <td>{{$contact->name}}</td>
                                        <td>{{$contact->phone}}</td>
                                        <td>{{$contact->email}}</td>
                                        <td>{{$contact->comment}}</td>
                                        <td>{{$contact->created_at}}</td>
                                    </tr>
                                    
                                 @endforeach
                           </tbody>
                       </table>
                       {{ $contacts->links()}}
                   </div>
               </div>
           </div>
       </div>
    </div>
</div>
