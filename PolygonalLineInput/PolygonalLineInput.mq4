//+------------------------------------------------------------------+
//|                                           PolygonalLineInput.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict

#include <Acem/PolygonalLineUtility.mqh>

CPolygonalLineUtility polyUtil;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
//--- indicator buffers mapping
    ChartSetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE, 0,  true);
    ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE, 0,  true);
    ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_DELETE, 0,  true);
//---
   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason) {
    Print("OnDeinit Test");
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
    polyUtil.OnChartEvent(id, lparam, dparam, sparam);
}
//+------------------------------------------------------------------+
