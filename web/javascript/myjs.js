/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

 <script>
             //ab this block will work only whne the function is called
             //by default ajax nhi chalega
            function getPosts(catId, temp){   //ye function catId as a parameter lega
                 //ye whii post return karega jis category id ko yaha pass karenge
                 //temp is a refernce to the link we have created
                $("#loader").show();
                 $("#post-cfontainer").hide();
                 
                 $(".c-link").removeClass('active');    //this will remove the blue color which denotes the active link from the category table jisme bhi class c-link hogi
                 
                 $.ajax({
                    url: "load_post.jsp",  //br deafult method get ho jaega
                    data: {cid : catId},   //cid is key and value is catId
                     success: function (data, textStatus, jqXHR){
                          
                         $('#loader').hide();
                         $('#post-container').show(data);  //ye load_post page se aa rha hai
                         $('#post-container').html(data);  //ye load_post page se aa rha hai
                         //jo bhi load_post pe hoga ...this will show it on profile page
                         $(temp).addClass('active');   //jispe click krenge ussi pe blue colour ho jaega
                     }
                     
                     
                     
                 });
             }
             
             $(document).ready(function(e){
                 
                //ref here is all post wali button ka reference
                //yaha pe hm nikaalenge all the elements jiski class c-link hai
                 let ref=$('.c-link')[0];  //0th pos pe jo element hai wo return hoga
                  getPosts(0,ref);
                  //passing 0 to the getPosts jisse wo saare post load kr dega and show krega on the profile page
                  //because when user jusr logged in.. they have not selected any category
                 
                 
             });
            
        </script>     
         
                  