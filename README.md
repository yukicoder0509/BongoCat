# Bongo Cat - Typing Companion (for Mac)

## Features: A cute cat that types with you!
<img width="498" height="306" alt="LeftHandDown" src="https://github.com/user-attachments/assets/eeec1031-8ebc-4c9f-88e8-43ff73663785" />

## How to build the project
1. Download the source code from this repository.
2. Use Xcode to open it. (you may need to download Xcode and install Mac developer tools in Xcode)
3. Open this project via Xcode (you may select the folder in Xcode, or double clicking the `BongoCatTyping.xcodeproj`)
4. Build the project
   - Find `Product` section in the top bar of Xcode <img width="727" height="35" alt="圖片" src="https://github.com/user-attachments/assets/f99a7c86-6c3e-42cf-b09c-a0c21239122d" />
   - Click `Build` in the `Product` menu. Then it will build the app.

      <img width="295" height="627" alt="圖片" src="https://github.com/user-attachments/assets/56d7a8bd-1854-444e-847f-a508bc4cdd0c" />
5. You can find the app in the files on the left side of the window! Right click on `BongoCatTyping.app` -> select `Show in finder`

   <img width="305" height="304" alt="圖片" src="https://github.com/user-attachments/assets/89cc7bea-8586-43d8-b1c6-505bfeacca81" />

6. Then copy it to any where you want (for example: `Applications`) the key it to keep the path short.
7. Finally you can run the app through command
   ```shell
   /<path-to-app>/BongoCatTyping.app/Contents/MacOS/BongoCatTyping
   ```
   substitute `<path-to-app>` to the folder that you put the built app.
   For example:
   ```shell
   /Application/BongoCatTyping.app/Contents/MacOS/BongoCatTyping
   ```
   - There might be some access problem when directly run the app (double click) due to global key event listening ~~because I didn't buy the Apple developer licence~~.
   - When running in the terminal, you system might prompt you that you need to grant access to terminal in setting. After access granted, the Bongo Cat app will run as a process inside terminal and inherent the access of your terminal app.
