# marbles

### 1. Download Marbles
We need to download marbles to your local system.
Let’s do this with Git by cloning this repository.
You will need to do this step even if you plan on hosting marbles in IBM Cloud.

- Open a command prompt/terminal and browse to your desired working directory
- Run the following command:

	```
	git clone https://github.com/IBM-Blockchain/marbles.git --depth 1
	cd marbles
	```

- Great I'll meet you at step 2.

<a name="getnetwork"></a>

### 2. Get a Network

Hello again. Now we need a blockchain network.

**Choose 1 option below:**

- **Option 1:** Create a network with the IBM Cloud IBM Blockchain Service - [instructions](./docs/use_bluemix_hyperledger.md)
- **Option 2:** :lollipop: Use a locally hosted Hyperledger Fabric Network - [instructions](./docs/use_local_hyperledger.md)

<a name="installchaincode"></a>

### 3. Install and Instantiate Chaincode

OK, almost there! Now we need to get our marbles chaincode running.
Remember the chaincode is a vital component that ultimately creates our marbles transactions on the ledger.
It is GoLang code that needs to be installed on our peer, and then instantiated on a channel.
The code is already written for you!
We just need to get it running.
There are two ways to do this.

Choose the **only** option that is relevant for your setup:

- **Option 1:** Install and instantiate chaincode with your IBM Blockchain Service - [instructions](./docs/install_chaincode.md)
- **Option 2:** :lollipop: Install and instantiate chaincode with the SDK locally - [instructions](./docs/install_chaincode_locally.md)

<a name="hostmarbles"></a>

### 4. Host Marbles

Last but not least we need marbles running somewhere.

**Choose 1 option below:**

- **Option 1:** Host marbles on IBM Cloud - [instructions](./docs/host_marbles_bluemix.md)
- **Option 2:** :lollipop: Host marbles locally - [instructions](./docs/host_marbles_locally.md)

***

<a name="use"></a>

# Use Marbles

1. If you are at this step, you should have your environment setup, blockchain network created, marbles app and chaincode running. Right? If not look up for help (up the page, not literally upwards).
1. Open up your favorite browser and browse to [http://localhost:3001](http://localhost:3001) or your IBM Cloud www route.
    - If the site does not load, check your node console logs for the hostname/ip and port marbles is using.

1. Finally we can test the application. Click the "+" icon on one of your users in the "United Marbles" section

	![](/doc_images/use_marbles1.png)

1. Fill out all the fields, then click the "CREATE" button
1. After a few seconds your new marble should have appeared.
    - If not refresh the page by hitting the refresh button in your browser, or by pressing F5
1. Next let’s trade a marble.  Drag and drop a marble from one owner to another. Only trade it to owners within "United Marbles" if you have multiple marble companies. It should temporary disappear and then redraw the marble within its new owner. That means it worked!
    - If not refresh the page
1. Now let’s delete a marble by dragging and dropping it into the trash can. It should disappear after a few seconds.

	![](/doc_images/use_marbles2.png)

1. Refresh the page to double check that your actions "stuck".
1. Use the search box to filter on marble owners or marble company names.  This is helpful when there are many companies/owners.
    - The pin icon will prevent that user from being filtered out by the search box.
1. Now lets turn on the special walk through. Click the "Settings" button near the top of the page.
	- A dialog box will open.
	- Click the "Enabled" button to enabled Story Mode
	- Click the "x" in the top right to close the menu.
	- Now pick another marble and drag it to another user.  You should see a breakdown of the transaction process. Hopefully it gives you a better idea of how Fabric works.
	- Remember you can disable story mode when it becomes frustratingly repetitive and you are a cold husk of your former self.
1. Congratulations you have a working marbles application :)!
