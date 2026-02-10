-- ================================================
-- 🛡️ TUX3T Script v4.1 - مع عداد الوقت المتبقي
-- 👤 @TT7DH | 📢 @TUX3T
-- ================================================

gg.setVisible(false)

-- ================== الإعدادات ==================
local PASSWORD = "@TUX3T"
local EXPIRE_TIME = os.time({year=2026, month=2, day=14, hour=15, min=47, sec=0})

-- 🕐 دالة حساب الوقت المتبقي
function getRemainingTime()
    local now = os.time()
    local secondsLeft = EXPIRE_TIME - now
    
    if secondsLeft <= 0 then
        return "⛔ انتهت الصلاحية!"
    end
    
    -- تحويل الثواني إلى ساعات ودقائق
    local hours = math.floor(secondsLeft / 3600)
    local minutes = math.floor((secondsLeft % 3600) / 60)
    local seconds = secondsLeft % 60
    
    if hours > 0 then
        return string.format("⏳ المتبقي: %d ساعة, %d دقيقة, %d ثانية", hours, minutes, seconds)
    elseif minutes > 0 then
        return string.format("⏳ المتبقي: %d دقيقة, %d ثانية", minutes, seconds)
    else
        return string.format("⏳ المتبقي: %d ثانية", seconds)
    end
end

-- 🔐 نظام التحقق من الباسورد والصلاحية
function checkAuth()
    -- حساب الوقت المتبقي
    local now = os.time()
    local timeLeft = EXPIRE_TIME - now
    
    -- إذا انتهت الصلاحية
    if timeLeft <= 0 then
        local expiredMsg = [[
╔══════════════════════════════╗
║     ⛔ انتهت الصلاحية!      ║
╚══════════════════════════════╝

📅 تاريخ الانتهاء: 20/02/2026
🕐 الوقت الحالي: ]] .. os.date("%H:%M:%S") .. [[

📢 يرجى تحميل الإصدار الجديد
👤 للدعم: @TT7DH
        ]]
        gg.alert(expiredMsg)
        os.exit()
    end
    
    -- التحذير إذا بقي أقل من 24 ساعة
    local hoursLeft = math.floor(timeLeft / 3600)
    if hoursLeft < 24 then
        local warningMsg = [[
⚠️ تحذير! صلاحية السكربت تنتهي قريباً

]] .. getRemainingTime() .. [[

📢 @TUX3T | 👤 @TT7DH
        ]]
        gg.alert(warningMsg)
    end
    
    -- عرض الوقت المتبقي أولاً
    local timeInfo = [[
📅 صلاحية السكربت:
]] .. getRemainingTime() .. [[

📅 تاريخ الانتهاء: 20/02/2026
🕐 الوقت الحالي: ]] .. os.date("%H:%M:%S") .. [[

🔐 أدخل الباسورد للمتابعة...
    ]]
    
    -- طلب الباسورد
    local input = gg.prompt({timeInfo, "🔐 كلمة السر:"}, {nil, ""}, {"label", "text"})
    
    if not input or input[2] ~= PASSWORD then
        gg.alert("✖︎ كلمة السر خاطئة!\n\n" .. getRemainingTime() .. "\n\n📢 للدعم: @TT7DH")
        os.exit()
    end
    
    -- رسالة النجاح مع الوقت المتبقي
    local successMsg = [[
╔══════════════════════════════╗
║     ✅ تم التحقق بنجاح!     ║
╚══════════════════════════════╝

🎮 أهلاً بك في سكربت TUX3T

]] .. getRemainingTime() .. [[

📢 القناة: @TUX3T
👤 الدعم: @TT7DH

⚡ جاري تحميل السكربت...
    ]]
    gg.alert(successMsg)
    return true
end

-- 🏷️ باقي السكربت يبدأ من هنا...
local SCRIPT_VERSION = "4.1"
local versionFile = "/storage/emulated/0/.tux3t_version.txt"

-- 🔗 معلومات التواصل
local TELEGRAM_USER = "@TT7DH"
local TELEGRAM_CHANNEL = "@TUX3T"
local TELEGRAM_CHANNEL_LINK = "https://t.me/TUX3T"

-- ✅ تحقق من التحديث الجديد
function checkForUpdates()
    local vf = io.open(versionFile, "r")
    if vf then
        local oldVersion = vf:read("*a")
        vf:close()
        if oldVersion ~= SCRIPT_VERSION then
            gg.alert("✅ تم تنزيل التحديث الجديد ("..SCRIPT_VERSION..")\n\n📢 تابعنا على:\n👤 "..TELEGRAM_USER.."\n📢 "..TELEGRAM_CHANNEL)
            local wf = io.open(versionFile, "w")
            if wf then
                wf:write(SCRIPT_VERSION)
                wf:close()
            end
        end
    else
        local wf = io.open(versionFile, "w")
        if wf then
            wf:write(SCRIPT_VERSION)
            wf:close()
        end
    end
end

-- 📦 حفظ القيم
local savedShoot = {}
local savedPossession = {}
local savedLuck = {}
local activeFeatures = {
    shoot = false,
    possession = false,
    luck = false
}

-- ... باقي كود السكربت (القائمة الرئيسية) يبدأ من هنا ...
-- ================== القائمة الرئيسية ==================
function mainMenu()
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)

            local header = "🌟 سكربت PES Mobile ⚽\n🎮 أدوات تعديل PES Mobile\n" .. 
                          getRemainingTime() .. "\n📢 "..TELEGRAM_CHANNEL.." | 👤 "..TELEGRAM_USER

            local menuItems = {
                '✅ تفعيل تسديد قوي',
                '❌ إيقاف تسديد قوي',
                '✅ تفعيل استحواذ 100%',
                '❌ إيقاف استحواذ',
                '✅ تفعيل نسبة حظ',
                '❌ إيقاف نسبة حظ',
                '⚡ تسريع اللعبة ×2',
                '⏸ إعادة السرعة العادية',
                '⏱️ مؤقت مباراة',
                '⚡ خيارات سرعة متقدمة',
                '📊 الميزات النشطة',
                '⏰ عرض الوقت المتبقي', -- خيار جديد
                '🔗 رابط القناة',
                '🚪 خروج'
            }

            local menu = gg.choice(menuItems, nil, header)

            if menu == 1 then
                gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_FLOAT)
                gg.searchNumber("1065353216;720;486;30000;1001:17", gg.TYPE_DWORD)
                gg.refineNumber("1065353216", gg.TYPE_DWORD)
                savedShoot = gg.getResults(10)
                if #savedShoot > 0 then
                    gg.editAll("1066399999", gg.TYPE_DWORD)
                    activeFeatures.shoot = true
                    gg.toast("✅ تم تفعيل التسديد القوي\n👤 "..TELEGRAM_USER)
                else
                    gg.toast("⚠️ لم يتم العثور على القيم!")
                end
                gg.clearResults()

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
                if #savedPossession > 0 then
                    gg.editAll("1063199999", gg.TYPE_DWORD)
                    activeFeatures.possession = true
                    gg.toast("✅ تم تفعيل الاستحواذ 100%\n👤 "..TELEGRAM_USER)
                end
                gg.clearResults()

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
                if #savedLuck > 0 then
                    gg.editAll("1066999999", gg.TYPE_DWORD)
                    activeFeatures.luck = true
                    gg.toast("✅ تم تفعيل نسبة الحظ\n👤 "..TELEGRAM_USER)
                end
                gg.clearResults()

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
                }, nil, "⏱️ اختر مدة المؤقت\n👤 "..TELEGRAM_USER)
                
                if timerChoice == 1 then
                    gg.alert("⏱️ تم تفعيل مؤقت 6:15 دقيقة...")
                    gg.sleep(375000)
                    gg.alert("⏰ انتهى الوقت! تفعيل التسريع ×10")
                    gg.setSpeed(10.0)
                elseif timerChoice == 2 then
                    gg.alert("⏱️ تم تفعيل مؤقت 3:00 دقيقة...")
                    gg.sleep(180000)
                    gg.alert("⏰ انتهى الوقت! تفعيل التسريع ×10")
                    gg.setSpeed(10.0)
                elseif timerChoice == 3 then
                    gg.alert("⏱️ تم تفعيل مؤقت 1:30 دقيقة...")
                    gg.sleep(90000)
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
                
                activeList = activeList .. "\n" .. getRemainingTime() .. "\n👤 "..TELEGRAM_USER.."\n📢 "..TELEGRAM_CHANNEL
                gg.alert(activeList)

            elseif menu == 12 then
                -- خيار جديد: عرض الوقت المتبقي
                local timeDetails = [[
⏰ معلومات صلاحية السكربت:

]] .. getRemainingTime() .. [[

📅 تاريخ الانتهاء: 20/02/2026
🕐 الوقت الحالي: ]] .. os.date("%H:%M:%S") .. [[
📅 اليوم: ]] .. os.date("%A %d/%m/%Y") .. [[

📢 القناة: @TUX3T
👤 الدعم: @TT7DH
                ]]
                gg.alert(timeDetails)

            elseif menu == 13 then
                gg.copyText(TELEGRAM_CHANNEL_LINK)
                gg.alert("🔗 رابط القناة:\n"..TELEGRAM_CHANNEL_LINK.."\n\n✅ تم نسخ الرابط\n📢 يمكنك فتحه الآن في المتصفح\n\n👤 "..TELEGRAM_USER)

            elseif menu == 14 then
                gg.toast("👋 تم الخروج\n" .. getRemainingTime() .. "\n👤 "..TELEGRAM_USER)
                os.exit()
            end
        end
        gg.sleep(400)
    end
end

-- ================== بدء التشغيل ==================
-- 1. التحقق من الباسورد والصلاحية
checkAuth()

-- 2. التحقق من التحديثات
checkForUpdates()

-- 3. عرض رسالة الترحيب
local welcomeMsg = [[
🎮 أهلاً بك في سكربت TUX3T Pro!

]] .. getRemainingTime() .. [[

📢 القناة: @TUX3T
👤 الدعم: @TT7DH

⚡ جاري تحميل السكربت...
]]
gg.alert(welcomeMsg)

-- 4. نسخ رابط القناة
gg.copyText(TELEGRAM_CHANNEL_LINK)
gg.alert("✅ تم نسخ رابط القناة\n📢 "..TELEGRAM_CHANNEL.."\n\n🔗 الرابط جاهز للفتح\n👤 للتواصل: "..TELEGRAM_USER)

-- 5. تشغيل القائمة الرئيسية
mainMenu()