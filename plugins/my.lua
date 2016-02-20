do

local function run(msg, matches)
  if matches[1] == 'me' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false)
      return "شما سرور مایی😂😂"
    elseif is_admin(msg) then
    send_document(get_receiver(msg), "./files/me/admin.webp", ok_cb, false)
      return "😐شما ادمین هستید"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./files/me/leader.webp", ok_cb, false)
      return "شما لیدر و دستیار سودو هستید😐"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return "شما مدیر هستید😐"
    else
    send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "شما کاربر ساده هستید😐"
    end
  end
end

return {
  patterns = {
    "^[!/]([Mm]e)$",
    "^([Mm]e)$"
    },
  run = run
}
end
