#####################################
#  oscilloscope example
#  
#   VL, 01/07

from sndobj import *
from Tkinter import *
import display
import array

# window size, refresh interval and norm factor
window_size = 300
time_interval = 0.2
norm = 32768.0

# display callback
def callb(data):
    sig  = array.array('f')
    osc  = data[0]
    disp = data[1]
    for i in range(0,osc.GetVectorSize()):
        sig.append(osc.Output(i)/norm)
    disp.draw(sig,time_interval*osc.GetSr())

# SndObj chain and process thread       
harm = HarmTable(10000,1,1)
mod = Oscili(harm, 10, 10000)
osc = Oscili(harm, 400, 10000, None, mod)
outp = SndRTIO(1, SND_OUTPUT, 2048)
outp.SetOutput(1, osc)
thread = SndThread()

# display object
disp = display.Oscilloscope(Tk(), window_size, thread.ProcOff, "green", "black")
dat = (osc,disp)
print time_interval*osc.GetSr()
# thread set-up
thread.SetProcessCallback(callb, dat)
thread.AddObj(mod)
thread.AddObj(osc)
thread.AddObj(outp, SNDIO_OUT)
thread.ProcOn()

# run the display
disp.mainloop()





