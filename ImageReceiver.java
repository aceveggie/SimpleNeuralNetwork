import java.net.*;
import java.io.*;
import java.lang.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import static com.googlecode.javacv.cpp.opencv_core.*;
import static com.googlecode.javacv.cpp.opencv_highgui.*;
import static com.googlecode.javacv.cpp.opencv_imgproc.*;


class ImageReceiver
{
    public static void main(String args[])
    {
        ServerSocket serverSocket = null;
        Socket clientSocket = null;
        int connects = 0;
        try
        {
            // Create the server socket
            serverSocket = new ServerSocket(4444, 5);

            while (connects < 5000)
            {
                // Wait for a connection
                clientSocket = serverSocket.accept();

                //Service the connection
                ServiceClient(clientSocket);
                connects++;
            }
            serverSocket.close();
        }
        catch (IOException ioe)
        {
            System.out.println("Error in SimpleWebServer: " + ioe);
        }
    }

    public static void ServiceClient(Socket client) throws IOException
    {
        DataInputStream inbound = null;
        DataOutputStream outbound = null;

        InputStream is = null;
        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        int bufferSize = 0;

        try
        {
            inbound = new DataInputStream( client.getInputStream());
            outbound = new DataOutputStream( client.getOutputStream());
            System.out.println("received a client");

            ///////////////////////////


            try
            {
                is = client.getInputStream();

                bufferSize = client.getReceiveBufferSize();
                //System.out.println("Buffer size: " + bufferSize);
            }
            catch (IOException ex)
            {
                System.out.println("Can't get socket input stream. ");
            }

            try
            {
                fos = new FileOutputStream("RECEIVED.png");
                bos = new BufferedOutputStream(fos);
            }
            catch (FileNotFoundException ex)
            {
                System.out.println("File not found. ");
            }

            byte[] bytes = new byte[bufferSize];

            int count;

            while ((count = is.read(bytes)) > 0)
            {
                bos.write(bytes, 0, count);
            }
           

            bos.flush();
            bos.close();

            IplImage img = cvLoadImage("RECEIVED.png",0);
            cvSaveImage("RECEIVED.png",img);            
            
                

        

            is.close();
            ///////////////////////////
            
        }
        finally
        {
            // Clean up
            System.out.println("Cleaning up connection: " + client);
            outbound.close();
            inbound.close();
            client.close();
            client.close();
        }
    }

    
}