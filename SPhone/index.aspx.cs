using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SKYPE4COMLib;

namespace SPhone
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Skype skype = new Skype();
            if (!skype.Client.IsRunning)
            {
                skype.Client.Start();
            }

            ((_ISkypeEvents_Event)skype).CallStatus += new _ISkypeEvents_CallStatusEventHandler(SkypeCallStatusEventHandler);
           // ((_ISkypeEvents_Event)skype).MessageStatus += new _ISkypeEvents_MessageStatusEventHandler(SkypeMessageStatusEventHandler);
            skype.Attach();
        }

        public void SkypeCallStatusEventHandler(Call call, TCallStatus status)
        {
            if (status == TCallStatus.clsRinging && (call.Type == TCallType.cltIncomingP2P || call.Type == TCallType.cltIncomingPSTN))
            {
                string callerName = call.PartnerDisplayName;
                CallAlert ca = new CallAlert();
                ca.CallerName(callerName);
                
                // Speak(String.Format("Incoming call from {0}", call.PartnerDisplayName));
            }
        }
    }
}