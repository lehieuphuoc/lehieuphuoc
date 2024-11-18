<?php

namespace models\client;

use commons\baseModel;

class home extends baseModel
{
    public function getAllProduct()
    {
        $sql = "SELECT 
    SP.id AS id_SP, 
    SP.ten_san_pham, 
    SP.gia_san_pham, 
    SP.khuyen_mai, 
    HA.hinh_anh_1, 
    HA.hinh_anh_2, 
    DMSM.id_danh_muc,
    (select dm.ten_danh_muc from danh_muc dm where dm.id = DMSM.id_danh_muc) as ten_danh_muc
    
FROM 
    san_pham AS SP 
JOIN 
    hinh_anh AS HA ON SP.id = HA.id_san_pham 
JOIN 
    danh_muc_small AS DMSM ON SP.id_DM_small = DMSM.id
WHERE 
    SP.khuyen_mai > 0
    ";
        return parent::pdoQueryAll($sql, []);
    }

    public function getAllProducts()
    {
        $sql = "SELECT 
    SP.id AS id_SP, 
    SP.ten_san_pham, 
    SP.gia_san_pham, 
    SP.ngay_them, 
    SP.khuyen_mai, 
    HA.hinh_anh_1, 
    HA.hinh_anh_2, 
    DMSM.id_danh_muc,
    (select dm.ten_danh_muc from danh_muc dm where dm.id = DMSM.id_danh_muc) as ten_danh_muc
    
FROM 
    san_pham AS SP 
JOIN 
    hinh_anh AS HA ON SP.id = HA.id_san_pham 
JOIN 
    danh_muc_small AS DMSM ON SP.id_DM_small = DMSM.id
ORDER BY 
    SP.ngay_them DESC
LIMIT 10
    ";
        return parent::pdoQueryAll($sql, []);
    }

    public function getAllCate() {
        $sql = "SELECT * FROM danh_muc";
        return parent::pdoQueryAll($sql, []);
    }

    public function getAllBlog() {
        
    }
}
