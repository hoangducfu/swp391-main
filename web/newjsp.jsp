<%-- 
    Document   : newjsp
    Created on : Jun 4, 2024, 1:12:02 AM
    Author     : hoangduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thay đổi ảnh sự kiện</title>
    <style>
        .form-group { padding-top: 30px; padding-bottom: 30px; }
        .form-label { font-size: 16px; }
        .content-holder { margin-top: 16px; }
        .default-event-thumb { position: relative; display: inline-block; }
        .thumb-change-btn { position: absolute; top: 10px; left: 10px; }
        .thumb-change-btn input[type="file"] { display: none; }
        .thumb-change-btn label { background-color: #007bff; color: white; padding: 5px 10px; cursor: pointer; }
    </style>
</head>
<body>

<div class="form-group">
    <label class="form-label">Thêm một vài hình ảnh cho sự kiện của bạn</label>
    <div class="content-holder">
        <div class="default-event-thumb">
            <div class="default-event-thumb-btn">
                <div class="thumb-change-btn">
                    <input type="file" id="thumb-img" accept=".jpg, .jpeg, .png">
                    <label for="thumb-img">Change Image</label>
                </div>
            </div>
            <img id="event-img" src="image/icon/banner.png" alt=""/>
        </div>
    </div>
</div>

<script>
    document.getElementById('thumb-img').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('event-img').src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });
</script>

</body>
</html>
