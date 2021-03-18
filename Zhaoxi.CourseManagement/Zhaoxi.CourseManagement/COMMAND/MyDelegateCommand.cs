using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Zhaoxi.CourseManagement.COMMAND
{
    class MyDelegateCommand : ICommand
    {
        /// <summary>
        /// 命令所需执行的事件
        /// </summary>
        public Action<object> ExecuteCommand { get; set; }
        /// <summary>
        /// 命令是否可用所执行的事件
        /// </summary>
        public Func<object, bool> CanExecuteCommand { get; set; }

        public MyDelegateCommand()
        {
        }

        public MyDelegateCommand(Action<object> execute, Func<object, bool> canexecute)
        {
            ExecuteCommand = execute;
            CanExecuteCommand = canexecute;
        }

        /// <summary>
        /// 命令可用性获取
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public bool CanExecute(object parameter)
        {
            return CanExecuteCommand(parameter);
        }

        public event EventHandler CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }

        /// <summary>
        /// 命令具体执行
        /// </summary>
        /// <param name="parameter"></param>
        public void Execute(object parameter)
        {
            ExecuteCommand(parameter);
        }
    }

    class TestViewModel : INotifyPropertyChanged
    {

        private string teststr;
        /// <summary>
        /// 待通知字符串
        /// </summary>
        public string TestStr
        {
            get { return teststr; }
            set
            {
                teststr = value;
                RaiseChanged("TestStr");
            }
        }

        /// <summary>
        /// 测试命令
        /// </summary>
        public ICommand TestCommand { get; set; }

        public TestViewModel()
        {
            TestCommand = new MyDelegateCommand();
            (TestCommand as MyDelegateCommand).ExecuteCommand = Test;
            (TestCommand as MyDelegateCommand).CanExecuteCommand = CanTest;
            //or
            //TestCommand = new MyDelegateCommand(Test, CanTest);
        }

        int i = 0;
        /// <summary>
        /// testcommand执行的方法
        /// </summary>
        /// <param name="para"></param>
        private void Test(object para)
        {
            i++;
            TestStr = i.ToString();
        }
        /// <summary>
        /// testcommand是否可用
        /// </summary>
        /// <param name="para"></param>
        /// <returns></returns>
        private bool CanTest(object para)
        {
            return true;
        }

        #region INotifyPropertyChanged接口实现
        public void RaiseChanged(string propertyname)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyname));
            }
        }
        public event PropertyChangedEventHandler PropertyChanged;
        #endregion
    }

}
