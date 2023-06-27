//+------------------------------------------------------------------+
//|                                               AcemSyncObject.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict

#include <Acem/Common/AcemUtility.mqh>
#include <Acem/Sync/AcemSyncObject.mqh>

#define INDICATOR_SHORT_NAME "AcemSyncObject"

CAcemSyncObject syncObj(INDICATOR_SHORT_NAME);

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
    IndicatorSetString(INDICATOR_SHORTNAME, INDICATOR_SHORT_NAME);
    long chartId = ChartID();
    if (isSameIndicator(chartId, INDICATOR_SHORT_NAME))
    {
        return (INIT_FAILED);
    }

    //--- indicator buffers mapping
    ChartSetInteger(chartId, CHART_EVENT_MOUSE_MOVE, true);
    ChartSetInteger(chartId, CHART_EVENT_OBJECT_CREATE, true);
    ChartSetInteger(chartId, CHART_EVENT_OBJECT_DELETE, true);
    //---
    
    syncObj.init();

    return (INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
    syncObj.deinit(reason);
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
  return (rates_total);
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
  syncObj.OnChartEvent(id, lparam, dparam, sparam);
}
//+------------------------------------------------------------------+
