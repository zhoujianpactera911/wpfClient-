using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;
using Zhaoxi.CourseManagement.Common;

namespace Zhaoxi.CourseManagement.Model
{
    public class LoginModel : NotifyBase
    {
        private string _userName;
        public string UserName
        {
            get { return _userName; }
            set
            {
                _userName = value;
                this.DoNotify();
            }
        }

        private string _password;

        public string Password
        {
            get { return _password; }
            set
            {
                _password = value;
                this.DoNotify();
            }
        }

        private string _validationCode;

        public string ValidationCode
        {
            get { return _validationCode; }
            set
            {
                _validationCode = value;
                this.DoNotify();
            }
        }

        private ImageSource _validationImge;
        public ImageSource ValidationImge
        {
            get { return _validationImge; }
            set
            {
                _validationImge = value;
                this.DoNotify(); 
            }
        }

        private string _validationImgeCode;
        public string ValidationImgeCode
        {
            get { return _validationImgeCode; }
            set { _validationImgeCode = value;}
        }
    }
}
