////////////////////////////////////////////////////////////////////////
// This file is part of the SndObj library
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
//
// Copyright (c)Victor Lazzarini, 1997-2004
// See License.txt for a disclaimer of all warranties
// and licensing information
// AudioDefs.i  SndObj Wrapper Interface
 
%module sndobj
%{

#ifndef NOPTHREAD
#include "SndThread.h" 
#include "SndRTThread.h"
#endif  

// Base Classes
#include "SndObj.h"
#include "SndIO.h" 
#include "Table.h"

// SndObj-derived
#include "Oscil.h"    // Oscillators
#include "Oscilt.h"
#include "Oscili.h"
#include "FastOsc.h"
#include "Osc.h"
#include "Osci.h"

#include "SndIn.h"    // Sound input
#include "SndRead.h"  // audio file input

#if defined(OSS) || defined(SGI) || defined(WIN)
#include "MidiIn.h"   // Midi input
#include  "Bend.h"    // pitch bend
#include "MidiMap.h" 
#endif

#include "ADSR.h"     // Envelopes
#include "IADSR.h" 

#include "Buzz.h"     // Buzzer

#include "Balance.h"  // Balance of signals
 

#include "DelayLine.h" // Delay line
#include  "Tap.h"      // Truncating tap
#include  "Tapi.h"     // Time-varying tap
#include  "Comb.h"     // Comb filter
#include  "Allpass.h"  // Allpass filter
#include  "StringFlt.h" // String filter
#include   "Pluck.h"    // Karplus-Strong
#include   "VDelay.h"   // Variable delay
#include   "Pitch.h"    // Pitch transposer
#include   "Loop.h"     // Looping
#include   "Fir.h"      // direct convolution

#include   "Filter.h"    // Fixed-freq/BW reson
#include   "TpTz.h"      // Two-pole Two-zero
#include    "Reson.h"    // Variable reson
#include    "Lp.h"       // Variable LP with resonance
#include    "ButtBP.h"   // Butterworth filters
#include    "ButtBR.h" 
#include    "ButtHP.h" 
#include    "ButtLP.h" 
#include    "Ap.h"       // 2nd order all-pass
#include    "LowPass.h"  // 1st order LP
#include    "HiPass.h"   // 1st order HP

#include    "Hilb.h"     // Hilbert transformer

#include    "SyncGrain.h" // granular synthesis
 
#include    "Mix.h"      // Mixer
#include    "Pan.h"     // panning
#include    "Gain.h"    // gain 
#include    "Interp.h"  // curve segments
#include    "Phase.h"    // phase accumulator
#include    "Ring.h"     // general-purpose multiplier
#include    "Unit.h"     // test signals

#include   "Lookup.h"     // table lookup
#include   "Lookupi.h"  

#include  "Rand.h"     // Noise
#include  "Randh.h"    // Band-limited noise
#include  "Randi.h"    // interpolated

// Spectral stuff
#include "FFT.h"        // windowed overlapping FFT
#include "IFFT.h"       // overlap-add IFFT
#include "PVA.h"        // pvoc analysis/synthesis
#include "PVS.h" 
#include "PVRead.h"                
#include "IFGram.h"

#include "SinAnal.h"    // sinusoidal analysis
#include "SinSyn.h"     // sinusoidal resynthesis
#include "AdSyn.h"		// additive resynthesis
#include "ReSyn.h"      // additive resynthesis if(m_status==OFF) Update();
#include  "IFAdd.h"      // additive resynthesis

#include  "SpecMult.h"    // spectral multiplication
#include  "SpecInterp.h"  // spectral interpolation
#include  "PVMask.h"	  // spectral masking
#include   "PVTransp.h"  // transposition
#include   "PVMix.h"     // mixing
#include   "PVBlur.h"    // blurring
#include   "PVFilter.h"    // mag filtering
#include  "PVMorph.h"     // pvoc morphing 
#include  "SpecPolar.h"  // polar converstion
#include  "SpecSplit.h"  // polar conversion & split
#include  "SpecThresh.h" // threshold filter
#include  "SpecVoc.h"    // impose magnitudes
#include  "SpecCart.h"   // cartesian conversion
#include  "SpecCombine.h" // combine phases & mags
#include   "SpecIn.h"   // spectral file input


#include "Convol.h"     // table-based convolution

#include "Ptrack.h"

// SndIO-derived
#include "SndFIO.h"   // Raw file IO 
#include "SndWave.h"  // RIFF-Wave
#include "SndWaveX.h" // waveformatextensible
#include "SndPVOCEX.h" // pvocex
#include "SndSinIO.h"  // sinusex
#include "SndAiff.h"  // AIFF
#include "SndBuffer.h" // memory buffer
 
#if defined(OSS) || defined(SGI) || defined(WIN)
#include "SndMidi.h"  // midi IO
#include "SndMidiIn.h"
#endif

#ifdef WIN 
#include "SndAsio.h" // ASIO-driver IO
#endif
#ifdef JACK
#include "SndJackIO.h" // Jack IO
#endif
#ifdef MACOSX
#include "SndCoreAudio.h" // Core Audio support
#endif
#include "SndRTIO.h" // WinMME/OSS/SGI RT IO

// Table-derived 
#include "HarmTable.h"    // wavetables
#include "UsrHarmTable.h"
#include "TrisegTable.h"  // envelope
#include  "EnvTable.h"    // envelope curves
#include "SndTable.h"     // soundfile input
#include "PlnTable.h"     // Polynomials
#include "HammingTable.h" // Windows
#include "NoteTable.h"    // midi note conversion
#include "UsrDefTable.h"  // user-definable
#include "LoPassTable.h"    // lowpass impulse response 
#include "SpecEnvTable.h"    // spectral envelope
#include "PVEnvTable.h"      // PV envelope
#include "PVTable.h"         // PV  frame
#include "ImpulseTable.h"    // linear FIR coeffs 

%}


%ignore SndObj::SndObj(SndObj &);
%ignore SndObj::operator=(SndObj);
%ignore Pitch::Pitch(float, SndObj*, int =0, int =DEF_VECSIZE, float =DEF_SR);


%include"SndObj.h"
%include"SndIO.h" 
%include"Table.h"

%include "carrays.i"
%array_functions(int, intp);
%array_functions(float, floatp);
%array_functions(double, doublep);

%inline %{
typedef SndObj* sndobjp;
%}

%array_class(int, intArray);
%array_class(float, floatArray);
%array_class(double, doubleArray)
%array_class(sndobjp, sndobjArray);

// typemap for callbacks
%typemap(in) PyObject *pyfunc {
  if(!PyCallable_Check($input)){
    PyErr_SetString(PyExc_TypeError, "Not a callable object!");
    return NULL;
}
$1 = $input;
}
 
#ifndef NOPTHREAD
%{
// this will be used as an interface to the
// callback


static void PythonCallback(void *p){

    PyObject *res;
    SndThread *t = (SndThread *) p;
    if(t->_tstate == NULL)
        t->_tstate = PyThreadState_New(PyInterpreterState_New()); 
    PyEval_AcquireThread(t->_tstate);    
    res = PyEval_CallObject(t->pydata.func, t->pydata.data);
    if (res == NULL){
    PyErr_SetString(PyExc_TypeError, "Exception in callback");
     }
    else Py_DECREF(res);    
   PyEval_ReleaseThread(t->_tstate);
}

static void PythonCallback1(void *p){

    PyObject *res;
    SndRTThread *t = (SndRTThread *) p;
    if(t->_tstate1 == NULL)
        t->_tstate1 = PyThreadState_New(PyInterpreterState_New()); 
    PyEval_AcquireThread(t->_tstate1);    
    res = PyEval_CallObject(t->pydata1.func, t->pydata1.data);
    if (res == NULL){
    PyErr_SetString(PyExc_TypeError, "Exception in callback");
     }
    else Py_DECREF(res);     
    PyEval_ReleaseThread(t->_tstate1);
}

%}

%ignore SndThread::SetProcessCallback(void (*Callback)(void *), void *cbdata);
%include "SndThread.h" 

%include "SndRTThread.h"
%extend SndThread {
   // Set the Python callback
   void SetProcessCallback(PyObject *pyfunc, PyObject *p){
    if(self->GetProcessCallback() == NULL) {
       PyEval_InitThreads();
       self->_tstate = NULL;
     }
     else Py_XDECREF(self->pydata.func);  
    self->pydata.func = pyfunc;
    self->pydata.data = Py_BuildValue("(O)", p);
    self->SetProcessCallback(PythonCallback, (void *)self);
    Py_XINCREF(pyfunc);

  }
}


%extend SndRTThread {
   // Set the Python callback
   void SetProcessCallback(PyObject *pyfunc, PyObject *p){
    if(self->GetProcessCallback() == NULL) {
       PyEval_InitThreads();
       self->_tstate1 = NULL;
     }
     else Py_XDECREF(self->pydata1.func);  
    self->pydata1.func = pyfunc;
    self->pydata1.data = Py_BuildValue("(O)", p);
    self->SetProcessCallback(PythonCallback1, (void *)self);
    Py_XINCREF(pyfunc);

  }
}
#endif 


// SndObj-derived
%include "Oscil.h"    // Oscillators
%include "Oscilt.h"
%include "Oscili.h"
%include "FastOsc.h"
%include "Osc.h"
%include "Osci.h"

%include "SndIn.h"    // Sound input
%include "SndRead.h"  // audio file input

#if defined(OSS) || defined(SGI) || defined(WIN)
%include "MidiIn.h"   // Midi input 
%include "Bend.h"    // pitch bend
%include "MidiMap.h" 
#endif

%include "ADSR.h"     // Envelopes
%include "IADSR.h" 

%include "Buzz.h"     // Buzzer

%include "Balance.h"  // Balance of signals

%include "DelayLine.h" // Delay line
%include "Tap.h"      // Truncating tap
%include "Tapi.h"     // Time-varying tap
%include "Comb.h"     // Comb filter
%include "Allpass.h"  // Allpass filter
%include "StringFlt.h" // String filter
%include  "Pluck.h"    // Karplus-Strong
%include  "VDelay.h"   // Variable delay
%include  "Pitch.h"    // Pitch transposer
%include  "Loop.h"     // Looping
%include  "Fir.h"      // direct convolution

%include  "Filter.h"    // Fixed-freq/BW reson
%include  "TpTz.h"      // Two-pole Two-zero
%include   "Reson.h"    // Variable reson
%include   "Lp.h"       // Variable LP with resonance
%include   "ButtBP.h"   // Butterworth filters
%include   "ButtBR.h" 
%include   "ButtHP.h" 
%include   "ButtLP.h" 
%include   "Ap.h"       // 2nd order all-pass
%include   "LowPass.h"  // 1st order LP
%include   "HiPass.h"   // 1st order HP

%include   "Hilb.h"     // Hilbert transformer

%include   "SyncGrain.h" // granular synthesis

%include   "Mix.h"      // Mixer
%include   "Pan.h"     // panning
%include   "Gain.h"    // gain 
%include   "Interp.h"  // curve segments
%include   "Phase.h"    // phase accumulator
%include   "Ring.h"     // general-purpose multiplier
%include   "Unit.h"     // test signals

%include  "Lookup.h"     // table lookup
%include  "Lookupi.h"  

%include "Rand.h"     // Noise
%include "Randh.h"    // Band-limited noise
%include "Randi.h"    // interpolated

// Spectral stuff

%include "FFT.h"        // windowed overlapping FFT
%include "IFFT.h"       // overlap-add IFFT
%include "PVA.h"        // pvoc analysis/synthesis
%include "PVS.h" 
%include "PVRead.h"                
%include "IFGram.h"

%include "SinAnal.h"    // sinusoidal analysis
%include "SinSyn.h"     // sinusoidal resynthesis
%include  "ReSyn.h"      // additive resynthesis
%include  "AdSyn.h"		// additive resynthesis
%include   "IFAdd.h"      // additive resynthesis

%include   "SpecMult.h"    // spectral multiplication
%include   "SpecInterp.h"  // spectral interpolation
%include   "PVMask.h"	  // spectral masking
%include    "PVTransp.h"  // transposition
%include    "PVMix.h"     // mixing
%include    "PVBlur.h"    // blurring
%include    "PVFilter.h"    // mag filtering
%include   "PVMorph.h"     // pvoc morphing 
%include   "SpecPolar.h"  // polar converstion
%include   "SpecSplit.h"  // polar conversion & split
%include   "SpecThresh.h" // threshold filter
%include   "SpecVoc.h"    // impose magnitudes
%include   "SpecCart.h"   // cartesian conversion
%include   "SpecCombine.h" // combine phases & mags
%include    "SpecIn.h"   // spectral file input

%include  "Convol.h"     // table-based convolution

%include "Ptrack.h"

// SndIO-derived
%include  "SndFIO.h"   // Raw file IO 
%include  "SndWave.h"  // RIFF-Wave
%include  "SndWaveX.h" // waveformatextensible
%include  "SndPVOCEX.h" // pvocex
%include  "SndSinIO.h"  // sinusex
%include  "SndAiff.h"  // AIFF
%include  "SndBuffer.h" // memory buffer 

#if defined(OSS) || defined(SGI) || defined(WIN)
%include  "SndMidi.h"  // midi IO
%include  "SndMidiIn.h"
#endif


#ifdef WIN
%include  "SndAsio.h" // ASIO-driver IO
#endif
#ifdef JACK
%include  "SndJackIO.h" // Jack IO
#endif
#ifdef MACOSX
%include  "SndCoreAudio.h" // Core Audio support
#endif
%include  "SndRTIO.h" // WinMME/OSS/SGI RT IO

// Table-derived 
%include  "HarmTable.h"    // wavetables
%include  "UsrHarmTable.h"
%include  "TrisegTable.h"  // envelope
%include   "EnvTable.h"    // envelope curves
%include  "SndTable.h"     // soundfile input
%include  "PlnTable.h"     // Polynomials
%include  "HammingTable.h" // Windows
%include  "NoteTable.h"    // midi note conversion
%include  "UsrDefTable.h"  // user-definable
%include  "LoPassTable.h"    // lowpass impulse response 
%include  "PVEnvTable.h"      // PV envelope
%include  "SpecEnvTable.h"    // spectral envelope
%include  "PVTable.h"         // PV  frame
%include  "ImpulseTable.h"    // linear FIR coeffs 


