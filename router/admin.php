<?php 
    autoloadFile('./src/controllers/admin/');
    autoloadFile('./src/models/admin/');

    //trang chủ admin
    $router->add("GET", "admin", "/admin", "AdminController@repload");
    $router->add("GET", "admin", "/admin/dashboard", "AdminController@index");

    //Trang sản phẩm
    $router->add("GET", "admin", "/admin/product-list", "productController@index");
    $router->add("GET", "admin", "/admin/product-add", "productController@create");

   
    

    // đăng xuất
    $router->add("GET", "admin", "/admin/dangxuat", "AdminController@dangxuat");


    $router->add("GET", "admin", "/taikhoanAdmin", "acountController@acount");



    $router->solve("admin");
?>