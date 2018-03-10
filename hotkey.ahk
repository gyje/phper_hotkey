;指定在notepad++程序中生效
#IfWinActive, ahk_class Notepad++
`::
if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
{
    winc_presses += 1
    return
}
; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
; 计时器:
winc_presses = 1
SetTimer, KeyWinC, -190 ; 在 190 毫秒内等待更多的键击.
return

KeyWinC:
if winc_presses = 1 ; 此键按下了一次.
{
    Send ,$  ; 
}
else if winc_presses = 2 ; 此键按下了两次.
{
    Send ,=>  ; 
}
; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
winc_presses = 0
return
