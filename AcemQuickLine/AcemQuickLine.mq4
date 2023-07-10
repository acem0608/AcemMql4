//+------------------------------------------------------------------+
//|                                                AcemQuickLine.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict

#include <Acem/QuickEdit/AcemQuickEditManagement.mqh>

CAcemQuickEditManagement quickManagement;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
    //--- indicator buffers mapping
    ChartSetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE, true);
    ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE, true);
    ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_DELETE, true);
    //---
    return (INIT_SUCCEEDED);
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
//| ChartEvent function                                               
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
   //---
   quickManagement.OnChartEvent(id, lparam, dparam, sparam);
}
//+------------------------------------------------------------------+
