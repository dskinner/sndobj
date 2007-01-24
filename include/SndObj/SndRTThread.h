// Copyright (c)Victor Lazzarini and Rory Walsh, 1997-2006
// See License.txt for a disclaimer of all warranties
// and licensing information

//
// SndRTThread.h 
// Class SndRTThread: 
// Multithreading support for the SndObj Library
// with Realtime audio IO
// Victor Lazzarini, 2001
// Win32 thread code by Rory Walsh, 2006

#ifndef _SNDRTTHREAD_H
#define _SNDRTTHREAD_H

#include "SndThread.h"
#include "Mix.h"
#include "SndIn.h"

class SndRTThread : public SndThread {

  SndIO *in; 
  SndIO *out;
  Mixer **ochannel;
  SndIn **sound;
  int m_channels;
  int m_buffsize;
  int m_periods;

  void Init();

 public:

#ifdef PYTHON_WRAP
  PyThreadState *_tstate1;
  pycallbackdata pydata1;
#endif

  SndRTThread();
  SndRTThread(int channels, int buffsize=1024, int periods=4);
  SndRTThread(int n, SndObj** objlist, int channels=2, int buffsize=1024, int periods=4);
  ~SndRTThread();

  int AddOutput(int channel, SndObj *in);
  int DeleteOutput(int channel, SndObj *in);
  void DisconnectOutput(int channel, SndObj *in);
  void ConnectOutput(int channel, SndObj *in);
  SndObj *GetInput(int channel);   
  void Direct(int channel, bool yes=true);
  friend void rtthreadfunc(void *);
};

void rtthreadfunc(void *);

#endif         



