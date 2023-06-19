//+------------------------------------------------------------------+
//|                                    SynchronizeMultipleCharts.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
#property indicator_chart_window

#define INDICATOR_SHORT_NAME  "AcemSyncMutiCharts"

#include <Acem/ObjectUtility.mqh>

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
  //--- indicator buffers mapping
  IndicatorSetString(INDICATOR_SHORTNAME, INDICATOR_SHORT_NAME);

  // 二重起動チェック
  int indicatorNum = ChartIndicatorsTotal(0, 0);
  int i;
  int indiNum = 0;
  for (i = 0; i < indicatorNum; i++) {
    string indiName = ChartIndicatorName(0, 0, i);
    Print (IntegerToString(i) + ":" + indiName);
    if (indiName == INDICATOR_SHORT_NAME) {
      indiNum++;
    }
  }

  if (indiNum > 1)
  {
    Print("起動済みなので起動しません");
    return (INIT_FAILED);
  }

  //  イベント取得設定
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
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
//---
   long currntId = ChartID();
   switch (id)
   {
   case CHARTEVENT_OBJECT_CREATE:
   {
    if (ChartGetInteger(currntId, CHART_BRING_TO_TOP))
    {
      writeObjectBaseProp(currntId, sparam);
      long targetId;
      for (targetId = ChartFirst(); targetId != -1; targetId = ChartNext(targetId))
      {
          if (targetId == currntId)
          {
              continue;
          }
          if (isTargetChart(currntId, targetId) == false)
          {
              continue;
          }

          EventChartCustom(targetId, 0, currntId, 0, sparam);
          ChartRedraw(targetId);
      }
    }
   }
   break;
   case CHARTEVENT_OBJECT_CHANGE:
   case CHARTEVENT_OBJECT_DRAG:
   {
    if (ChartGetInteger(currntId, CHART_BRING_TO_TOP))
    {
      long targetId;
      writeObjectBaseProp(currntId, sparam);
      for (targetId = ChartFirst(); targetId != -1; targetId = ChartNext(targetId))
      {
          if (targetId == currntId)
          {
              continue;
          }
          if (isTargetChart(currntId, targetId) == false)
          {
              continue;
          }
          EventChartCustom(targetId, 1, currntId, 0, sparam);
          ChartRedraw(targetId);
      }
    }
   }
   break;
   case CHARTEVENT_OBJECT_DELETE:
   {
    if (ChartGetInteger(currntId, CHART_BRING_TO_TOP))
    {
      long targetId;
      for (targetId = ChartFirst(); targetId != -1; targetId = ChartNext(targetId))
      {
          if (targetId != currntId)
          {
              deleteObject(targetId, sparam);
              ChartRedraw(targetId);
          }
      }
    }
   }
   break;
   case CHARTEVENT_CUSTOM:
   {
    if (ChartGetInteger(currntId, CHART_BRING_TO_TOP))
    {
      break;
    }
    cloneObject(lparam, sparam);
    ChartRedraw(currntId);
   }
   break;
   case CHARTEVENT_CUSTOM + 1:
   {
    if (ChartGetInteger(currntId, CHART_BRING_TO_TOP))
    {
      break;
    }
    setSameProp(lparam, sparam);
    ChartRedraw(currntId);
   }
   break;
   }
  }
//+------------------------------------------------------------------+

bool isTargetChart(long currentId, long targetId) {
  bool retc = false;
  
  if (ChartSymbol(currentId) != ChartSymbol(targetId)) {
    return false;
  }
  
  int indiNum = ChartIndicatorsTotal(targetId, 0);

  string strIndiName;
  int i;
  for (i = 0; i < indiNum; i++) {
    strIndiName = ChartIndicatorName(targetId, 0, i);
    if (strIndiName ==  INDICATOR_SHORT_NAME) {
      retc = true;
      break;
    }
  }

  return retc;
}