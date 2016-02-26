local lock = 1
local txt = "\n\nSticker Maker By @amirho3ein911" -- Lotfan Ino Pak Nakonid Bara In Plugin Zahmat Ziadi Keshidam
local function callback(extra, success, result) -- Calback Bara Load Kardn ax
  if success then
    local file = 'sticker/sticker.webp'
    print('File downloaded to:', result)
     os.rename(result, file)
     print('File moved to:', file)
     
  else
    print('Error downloading: '..extra)
  end
end
--khob berim function run ro benvisim 
local function run(msg, matches)
local file = 'sticker/sticker.webp'

if msg.to.type == 'chat' then

if matches[1]== "off" then
    if is_sudo(msg) then
lock = 1
return "ساخت استیکر محدود شد \nاز این پس تنها صاحب ربات|ادمینان گلوبال|صاحبان گروه توانایی ساخت استیکر خواهد داشت"
else
return "شما دسترسی ندارید"
end
end

if matches[1]== "on" then
    if is_sudo(msg) then
lock = 0
return "ساخت استیکر مجاز شد \nاز این پس همه کاربران توانایی ساخت استیکر را دارند"
else

return "شما دسترسی ندارید"
end
end
-----------------------------
if matches[1] == "sticker" then
    if lock == 0 then
    send_document(get_receiver(msg), "./"..file, ok_cb, false)
    return 'لطفا صبر کنید ... '..txt
else
    if is_momod(msg) then 
        send_document(get_receiver(msg), "./"..file, ok_cb, false)
    return 'لطفا صبر کنید ... '..txt
   end
   if not is_momod(msg) then
    return "ساخت استیکر برای کاربران معمولی ممنوع است"..txt
    end
end
end

if matches[1] == "status" then
if lock == 1 then
    return 'ساخت استیکر برای کاربران معمولی: ممنوع'
else
return 'ساخت استیکر برای کاربران معمولی: مجاز'    
end

end
if msg.media then
    if msg.media.type == 'photo' then
        
      load_photo(msg.id, callback, msg.id)
      if lock == 0 then
             return 'عکس ذخیره شد \nبا ریپلی و ارسال sticker عکس را به استیکر تبدیل نمایید'..txt
    else
        return ''
    end
    
end

   
end
else
return 'ساخت استیکر فقط در گروه امکان پذیر است'..text
end

   end

return {
  patterns = {
  "^[/!](sticker)$",
  "^[/!](status)$",
  "^[/!](on)",
 "^[/!](off)$",
  '%[(photo)%]' 
  },
  run = run
}
