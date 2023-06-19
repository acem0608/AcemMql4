#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>

class MyDialog : public CAppDialog{
   private:
      CButton btn;
   public:
      virtual bool Create();
};

bool MyDialog::Create(){
   if(!CAppDialog::Create(0, "MainDialog", 0, 100, 100, 300, 300)){
      return(false);
   }
   
   if(!btn.Create(0, "Button", 0, 20, 60, 180, 140)) return(false);
   if(!btn.Font("Terminal")) return(false);
   if(!btn.Text("Test")) return(false);
   
   if(!Add(btn)) return(false);
   
   return(true);
}