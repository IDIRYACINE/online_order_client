# online_order_client

<h1>Cart</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Design Cart Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
 <tr>
    <td>Display Products In Cart</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
  <tr>
    <td>Customer Can Add Product To Cart</td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
   <tr>
    <td>Customer Can Remove Product From Cart</td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
   <tr>
    <td>Customer Can Edit Products</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
   <tr>
    <td>Customer Can Clear Cart</td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
   <tr>
    <td>Display Total Price</td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
   <tr>
    <td>Customer Can Send Order </td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
<table/>

<h1>Delivery Addres</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Design Gps Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
   <tr>
    <td>Get Estimate Location</td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
   <tr>
    <td>Set Location</td>
    <td>Done</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
<table/>


<h1>Database</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Connect/Disconnect</td>
    <td>Completed </td>
    <td>4</td>
    <td>IDIR</td>
  </tr>
 <tr>
    <td>Create Database Schema</td>
    <td>Completed</td>
    <td>3</td>
    <td>IDIR</td>
  </tr>
  <tr>
    <td>Map Query To Products </td>
    <td>Completed</td>
    <td>1</td>
    <td>IDIR</td>
  </tr> 
  <tr>
    <td>Request Categories/Products</td>
    <td>Completed</td>
    <td>1</td>
    <td>IDIR</td>
  </tr>
<table/>


<h1>Place Orders</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Map Cart Products To Server Order</td>
    <td>on progress</td>
    <td>2</td>
    <td>IDIR</td>
  </tr>
 <tr>
    <td>Check Deliverability To Address</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
  <tr>
    <td>Check Ban Status</td>
    <td>on progress</td>
    <td>1</td>
    <td>IDIR</td>
  </tr> 
  <tr>
    <td>Create Order Notification</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
    <tr>
    <td>Create Order Status Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
<table/>

<h1>Catalogue</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Display Products By Category</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
   <tr>
    <td>Create Catalogue Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
   <tr>
    <td>Load More Products As Needed</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
<table/>

<h1>Products</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Create Product Details Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
</table>
  
<h1>Others</h1>
<table>
  <tr>
    <th>Task</th>
    <th>Status</th>
    <th>Esitamte Size</th>
    <th>Devolopper</th>
</tr>
 <tr>
    <td>Create Profile Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
 <tr>
    <td>Create Profile Model</td>
    <td>Done</td>
    <td>3</td>
    <td>IDIR</td>
  </tr>
  
   <tr>
    <td>Create Settings Screen</td>
    <td>Not Done</td>
    <td>None</td>
    <td>None</td>
  </tr>
<table/>
  <h1>RealTime Database Structure</h1>
  Notice : Have yet to decide on getting delivery address from a local server user database or give it a section in realTime Database
  as it can save some data usage overtime (does include name , phone , address..etc)
 
  {  
  // Client Use it To Keep Local Products Database Updated    
  "database" : "version",  
  
  // Track Order Status  
  status : {"phoneMac" : "state"},  
  
  // Register Order   
  orders : {"phoneMac" :
    "time" : "xx:xx",
    "products" : {"product name" : "count"}  
  },   
  
  // To Register New Users / User Data Change  
  new_users  
  {  
   "phoneMac" : {"name" , "delivery_address" , "phone_number" , "email" }  
  }   
  }  
 

