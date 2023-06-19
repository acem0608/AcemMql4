//+------------------------------------------------------------------+
//|                                                  ProjectTest.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
#include "TestDlg.mqh"

MyDialog dialog;

int OnInit()
  {
//--- indicator buffers mapping
   if(!dialog.Create()) return(INIT_FAILED);
   if(!dialog.Run()) return(INIT_FAILED);


//---
   return(INIT_SUCCEEDED);
  }
  
 int deinit()
 {
   dialog.Destroy();
   
   return (0);
 }
 
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   dialog.ChartEvent(id, lparam, dparam, sparam);
   
   if(id == CHARTEVENT_OBJECT_CLICK){
      if(sparam == "Button"){
         Alert("hoge");
      }
   }
  }
//+------------------------------------------------------------------+
