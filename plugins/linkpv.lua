do

if matches[1] == 'link' then
      if not is_momod(msg) then
        return "شما دسترسی دریافت لینک ندارید"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "ابتدا با دستور !newlink لینک گروه را ایجاد کنید"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
      return "لینک دعوت به گروه:\n"..group_link
    end
    if matches[1] == 'linkpv' then
      if not is_owner(msg) then
        return "شما دسترسی ندارید"
       end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "ابتدا با دستور!newlink لینک گروه را ایجاد کنید!"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
     send_large_msg('user#id'..msg.from.id, "لینک دعوت به گروه\n"..group_link)
    return "لینک با موفقیت ارسال شد"
end
if matches[1] == 'linkpv' then
   local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "ابتدا با دستور!newlink لینک گروه را ایجاد کنید!"
       end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
     send_large_msg('user#id'..msg.from.id, "لینک دعوت به گروه\n"..group_link)
    return ""
    end
