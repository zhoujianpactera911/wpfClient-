using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Zhaoxi.CourseManagement.COMMAND
{
    public class DelegateCommand : ICommand
    {
        public Action<object> ExecuteCommand = null;
        public Func<object, bool> CanExecuteCommand = null;

        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            if (CanExecuteCommand != null)
            {
                return this.CanExecuteCommand(parameter);
            }
            else
            {
                return true;
            }
        }
        public void Execute(object parameter)
        {
            if (this.ExecuteCommand != null) this.ExecuteCommand(parameter);
        }
        public void RaiseCanExecuteChanged()
        {
            if (CanExecuteChanged != null)
            {
                CanExecuteChanged(this, EventArgs.Empty);
            }
        }

    }

    public class ViewModel
    {
        public DelegateCommand BuildCommand { get; set; }
        public ViewModel()
        {
            BuildCommand = new DelegateCommand();
            BuildCommand.ExecuteCommand = new Action<object>(Build);
            BuildCommand.CanExecuteCommand = new Func<object, bool>((o) => { return true; });
        }
        private void Build(object obj)
        {
            MessageBox.Show(obj.ToString());
        }
    }

}
