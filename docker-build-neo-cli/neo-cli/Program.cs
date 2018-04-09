using Neo.Shell;
using Neo.Wallets;
using System;
using System.IO;

namespace Neo
{
    static class Program
    {
          internal static Wallet Wallet;

        private static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            using (FileStream fs = new FileStream("error.log", FileMode.Create, FileAccess.Write, FileShare.None))
            using (StreamWriter w = new StreamWriter(fs))
            {
                PrintErrorLogs(w, (Exception)e.ExceptionObject);
            }
        }

        static void Main(string[] args)
        {
	    FileStream ostrm;
	    StreamWriter writer;
	    TextWriter oldOut = Console.Out;
	    try
	    {
		ostrm = new FileStream ("./Redirect.txt", FileMode.OpenOrCreate, FileAccess.Write);
		writer = new StreamWriter (ostrm);
	    }
	    catch (Exception e)
	    {
		Console.WriteLine ("Cannot open Redirect.txt for writing");
		Console.WriteLine (e.Message);
		return;
	    }
	    Console.SetOut (writer);

            AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
            new MainService().Run(args);

	    Console.SetOut (writer);
	    Console.WriteLine ("This is a line of text");
	    Console.WriteLine ("Everything written to Console.Write() or");
	    Console.WriteLine ("Console.WriteLine() will be written to a file");
	    Console.SetOut (oldOut);
	    writer.Close();
	    ostrm.Close();
	    Console.WriteLine ("Done");
        }

        private static void PrintErrorLogs(StreamWriter writer, Exception ex)
        {
            writer.WriteLine(ex.GetType());
            writer.WriteLine(ex.Message);
            writer.WriteLine(ex.StackTrace);
            if (ex is AggregateException ex2)
            {
                foreach (Exception inner in ex2.InnerExceptions)
                {
                    writer.WriteLine();
                    PrintErrorLogs(writer, inner);
                }
            }
            else if (ex.InnerException != null)
            {
                writer.WriteLine();
                PrintErrorLogs(writer, ex.InnerException);
            }
        }
    }
}
