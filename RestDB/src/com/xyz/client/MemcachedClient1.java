package com.xyz.client;

import net.spy.memcached.MemcachedClient;

// java.util



import java.io.*;
import java.net.InetSocketAddress;




public class MemcachedClient1 {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException 
	{
		
		MemcachedClient c=new MemcachedClient( new InetSocketAddress("localhost", 11211));
		//MemCachedClient c=new MemCachedClient(new InetSocketAddress("localhost", 11211));

			// Store a value (async) for one hour
			c.set("someKey1", 10, "hello");
			// Retrieve a value (synchronously).
			Object myObject=c.get("someKey");
			System.out.println((String)myObject);

	}

}
