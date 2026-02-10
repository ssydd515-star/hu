-- 🏷️ إصدار السكربت
local SCRIPT_VERSION = "4.1"

-- 📂 ملفات التخزين
local versionFile = "/storage/emulated/0/.script_version.txt"

-- 🔗 معلومات التواصل
local TELEGRAM_USER = "@TT7DH"
local TELEGRAM_CHANNEL = "@TUX3T"
local TELEGRAM_CHANNEL_LINK = "https://t.me/TUX3T" -- رابط القناة

-- ✅ تحقق من التحديث الجديد
local vf = io.open(versionFile, "r")
if vf then
    local oldVersion = vf:read("*a")
    vf:close()
    if oldVersion ~= SCRIPT_VERSION then
        gg.alert("✅ تم تنزيل التحديث الجديد ("..SCRIPT_VERSION..")\n\n📢 تابعنا على:\n👤 "..TELEGRAM_USER.."\n📢 "..TELEGRAM_CHANNEL)
        local wf = io.open(versionFile, "w")
        wf:write(SCRIPT_VERSION)
        wf:close()
    end
else
    local wf = io.open(versionFile, "w")
    wf:write(SCRIPT_VERSION)
    wf:close()
    gg.alert("✅ تم تنزيل التحديث الجديد ("..SCRIPT_VERSION..")\n\n📢 تابعنا على:\n👤 "..TELEGRAM_USER.."\n📢 "..TELEGRAM_CHANNEL)
end

-- 🔗 فتح رابط القناة مباشرة عند التشغيل
gg.alert("🎮 أهلاً بك في سكربت PES Mobile!\n\n⚽ أفضل أدوات تعديل لعبة FIFA Mobile\n\n📢 سيتم توجيهك إلى قناتنا الآن...")
gg.copyText(TELEGRAM_CHANNEL_LINK)
gg.alert("✅ تم نسخ رابط القناة\n📢 "..TELEGRAM_CHANNEL.."\n\n🔗 الرابط جاهز للفتح في المتصفح\n\n👤 للتواصل: "..TELEGRAM_USER)

-- 📦 حفظ القيم
local savedShoot = {}
local savedPossession = {}
local savedLuck = {}
local activeFeatures = {
    shoot = false,
    possession = false,
    luck = false
}

-- 🎯 القائمة الرئيسية
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)

        local header = "🌟 سكربت PES Mobile ⚽\n🎮 أدوات تعديل PES Mobile\n📢 "..TELEGRAM_CHANNEL.." | 👤 "..TELEGRAM_USER

        local menuItems = {
            '✅ تفعيل تسديد قوي',
            '❌ إيقاف تسديد قوي',
            '✅ تفعيل استحواذ 100%',
            '❌ إيقاف استحواذ',
            '✅ تفعيل نسبة حظ',
            '❌ إيقاف نسبة حظ',
            '⚡ تسريع اللعبة',
            '⏸ إعادة السرعة العادية',
            '⏱️ مؤقت مباراة',
            '⚡ خيارات سرعة متقدمة',
            '📊 الميزات النشطة',
            '🔗 رابط القناة',
            '🚪 خروج'
        }

        local menu = gg.choice(menuItems, nil, header)

        if menu == 1 then
            gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_FLOAT)
            gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_DWORD)
            gg.refineNumber("1065353216", gg.TYPE_DWORD)
            savedShoot = gg.getResults(10)
            gg.editAll("1066399999", gg.TYPE_DWORD)
            gg.clearResults()
            activeFeatures.shoot = true
            gg.toast("✅ تم تفعيل التسديد القوي\n👤 "..TELEGRAM_USER)

        elseif menu == 2 then
            if #savedShoot > 0 then
                gg.setValues(savedShoot)
                activeFeatures.shoot = false
                gg.toast("❌ تم إيقاف التسديد القوي\n👤 "..TELEGRAM_USER)
            else
                gg.toast("⚠️ لا توجد قيم محفوظة!")
            end

        elseif menu == 3 then
            gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_FLOAT)
            gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_DWORD)
            gg.refineNumber("1065353216", gg.TYPE_DWORD)
            savedPossession = gg.getResults(10)
            gg.editAll("1063199999", gg.TYPE_DWORD)
            gg.clearResults()
            activeFeatures.possession = true
            gg.toast("✅ تم تفعيل الاستحواذ 100%\n👤 "..TELEGRAM_USER)

        elseif menu == 4 then
            if #savedPossession > 0 then
                gg.setValues(savedPossession)
                activeFeatures.possession = false
                gg.toast("❌ تم إيقاف الاستحواذ\n👤 "..TELEGRAM_USER)
            else
                gg.toast("⚠️ لا توجد قيم محفوظة!")
            end

        elseif menu == 5 then
            gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_FLOAT)
            gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_DWORD)
            gg.refineNumber("1065353216", gg.TYPE_DWORD)
            savedLuck = gg.getResults(10)
            gg.editAll("1066999999", gg.TYPE_DWORD)
            gg.clearResults()
            activeFeatures.luck = true
            gg.toast("✅ تم تفعيل نسبة الحظ\n👤 "..TELEGRAM_USER)

        elseif menu == 6 then
            if #savedLuck > 0 then
                gg.setValues(savedLuck)
                activeFeatures.luck = false
                gg.toast("❌ تم إيقاف نسبة الحظ\n👤 "..TELEGRAM_USER)
            else
                gg.toast("⚠️ لا توجد قيم محفوظة!")
            end

        elseif menu == 7 then
            gg.setSpeed(2.0)
            gg.alert("⚡ تم تسريع اللعبة ×2\n👤 "..TELEGRAM_USER)

        elseif menu == 8 then
            gg.setSpeed(1.0)
            gg.alert("⏸ تم إعادة السرعة العادية\n👤 "..TELEGRAM_USER)

        elseif menu == 9 then
            local timerChoice = gg.choice({
                "⏱️ 6:15 دقيقة",
                "⏱️ 3:00 دقيقة",
                "⏱️ 1:30 دقيقة",
                "🔙 رجوع"
            }, nil, "⏱️ اختر مدة المؤقت")
            
            if timerChoice == 1 then
                gg.alert("⏱️ تم تفعيل مؤقت 6:15 دقيقة...")
                gg.sleep(375000) -- 6 دقائق و 15 ثانية
                gg.alert("⏰ انتهى الوقت! تفعيل التسريع ×10")
                gg.setSpeed(10.0)
            elseif timerChoice == 2 then
                gg.alert("⏱️ تم تفعيل مؤقت 3:00 دقيقة...")
                gg.sleep(180000) -- 3 دقائق
                gg.alert("⏰ انتهى الوقت! تفعيل التسريع ×10")
                gg.setSpeed(10.0)
            elseif timerChoice == 3 then
                gg.alert("⏱️ تم تفعيل مؤقت 1:30 دقيقة...")
                gg.sleep(90000) -- 1 دقيقة و 30 ثانية
                gg.alert("⏰ انتهى الوقت! تفعيل التسريع ×10")
                gg.setSpeed(10.0)
            end

        elseif menu == 10 then
            while true do
                local choice = gg.choice({
                    "🐢 بطيء 0.25x",
                    "🚶 نصف سرعة 0.5x",
                    "🚗 عادي 1x",
                    "🚀 سريع 2x",
                    "🔥 أسرع 3x",
                    "⚡ خارق 5x",
                    "💥 فائق 10x",
                    "🔙 رجوع"
                }, nil, "⚡ خيارات السرعة\n👤 "..TELEGRAM_USER)
                
                local speeds = {0.25, 0.5, 1.0, 2.0, 3.0, 5.0, 10.0}
                
                if choice == nil or choice == 8 then 
                    break
                elseif choice >= 1 and choice <= 7 then
                    gg.setSpeed(speeds[choice])
                    gg.alert("⚡ تم ضبط السرعة: " .. speeds[choice] .. "x\n👤 "..TELEGRAM_USER)
                end
            end

        elseif menu == 11 then
            local activeList = "📊 الميزات النشطة:\n\n"
            if activeFeatures.shoot then
                activeList = activeList .. "✅ تسديد قوي\n"
            else
                activeList = activeList .. "❌ تسديد قوي\n"
            end
            
            if activeFeatures.possession then
                activeList = activeList .. "✅ استحواذ 100%\n"
            else
                activeList = activeList .. "❌ استحواذ 100%\n"
            end
            
            if activeFeatures.luck then
                activeList = activeList .. "✅ نسبة حظ\n"
            else
                activeList = activeList .. "❌ نسبة حظ\n"
            end
            
            activeList = activeList .. "\n👤 "..TELEGRAM_USER.."\n📢 "..TELEGRAM_CHANNEL
            
            gg.alert(activeList)

        elseif menu == 12 then
            gg.copyText(TELEGRAM_CHANNEL_LINK)
            gg.alert("🔗 رابط القناة:\n"..TELEGRAM_CHANNEL_LINK.."\n\n✅ تم نسخ الرابط\n📢 يمكنك فتحه الآن في المتصفح\n\n👤 "..TELEGRAM_USER)

        elseif menu == 13 then
            gg.toast("👋 تم الخروج\n👤 "..TELEGRAM_USER)
            os.exit()
        end
    end
    gg.sleep(400)
end