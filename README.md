# injera-mold-detection


Description:
The Injera Mold Detection App is a mobile application designed to assist users in detecting mold on injera, a traditional Ethiopian flatbread. The app features four main pages:

1. **Splash Screen:**
   - Upon launching the app, users are greeted with a splash screen, providing a seamless and engaging introduction to the application.

2. **Home Page:**
   - The home page serves as the central hub for navigation within the app. Users can access various features and functionalities from this page.

3. **Take Photo Page:**
   - In this page, users can capture photos of injera using their device's camera or choose images from the gallery. This functionality allows for easy input of images for mold detection analysis.

4. **Results Page:**
   - The results page displays the outcomes of the mold detection process. Leveraging machine learning image detection algorithms, users can view the detected areas of mold on the injera images processed by the app.

The app aims to streamline the process of identifying mold on injera, providing users with a convenient and efficient tool for ensuring food safety and quality. Through its intuitive interface and advanced detection capabilities, the Injera Mold Detection App empowers users to make informed decisions about the consumption of injera, contributing to overall health and well-being.




Installation:

To set up the Injera Mold Detection App, follow these steps:

1. **Flutter:**
   - Ensure that you have Flutter installed on your development machine. You can download and install Flutter from the official website: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. **FastAPI:**
   - FastAPI is used for the backend of the application. You can install FastAPI and its dependencies using pip:
     ```
     pip install fastapi uvicorn
     ```

3. **Python Libraries:**
   - Install the necessary Python libraries used in the backend code. You can install them using pip:
     ```
     pip install ultralytics pillow numpy matplotlib opencv-python
     ```

4. **Additional Setup:**
   - Ensure that you have the required packages and tools installed in your development environment, including:
     - `io` (Standard Python library)
     - `uvicorn` (ASGI server)
     - `base64` (Standard Python library)
     - `PIL` (Python Imaging Library)
     - `numpy` (Numerical computing library for Python)
     - `matplotlib` (Data visualization library)
     - `cv2` (OpenCV library for computer vision)
     - `Annotator` and `YOLO` from Ultralytics (For object detection)

5. **Running the Backend:**
   - Once installed, you can start the FastAPI backend by running the following command in the terminal:
     ```
     uvicorn main:app --reload
     ```
     Replace `main` with the name of your FastAPI script.

6. **Setting up Flutter:**
   - Follow the instructions provided in the Flutter documentation to set up your development environment for building Flutter apps: [Flutter Documentation](https://flutter.dev/docs/get-started/install)

7. **Running the Flutter App:**
   - After setting up Flutter, navigate to the directory containing your Flutter project and run the app using the following command:
     ```
     flutter run
     ```

By following these installation steps, you'll have the necessary environment and dependencies set up to run the Injera Mold Detection App smoothly on your local machine.





Usage:

To utilize the Injera Mold Detection App, follow the instructions below:

1. **Running the Backend:**
   - Ensure that both your computer (where the backend is hosted) and your mobile device (where the app will be tested) are connected to the same Wi-Fi network.
   - Navigate to the directory containing the backend files of the application on your computer.
   - Execute the following command in your terminal to start the backend server:
     ```
     uvicorn api:app --host <your_computer_ip_address> --port 8000 --reload
     ```
     Replace `<your_computer_ip_address>` with the IP address of your computer on the Wi-Fi network.

2. **Running the Frontend:**
   - Navigate to the directory containing the frontend files of the application on your mobile device.
   - Launch the Flutter app by executing the following command in your terminal:
     ```
     flutter run
     ```

By following these steps and ensuring that both your computer and mobile device are connected to the same Wi-Fi network, you'll have both the backend and frontend components of the Injera Mold Detection App up and running. You can now interact with the app's interface to capture or select images of injera.


Results:

[Link to Results and Analysis Document](https://gamma.app/docs/Members-oil0fivp38dv9en?mode=doc)



Contributing:

We welcome contributions from the community to enhance the functionality and quality of the Injera Mold Detection App. Below are some guidelines for contributing to the project:

1. **Reporting Bugs:**
   - If you encounter any bugs or issues while using the app, please report them by opening a new issue on our GitHub repository. Be sure to include detailed information about the bug, including steps to reproduce it and any error messages you encountered.

2. **Suggesting Features:**
   - We appreciate suggestions for new features or improvements to the app. You can submit your ideas by opening a new feature request issue on our GitHub repository. Clearly describe the proposed feature and explain how it would benefit users of the app.

3. **Submitting Code Changes:**
   - If you'd like to contribute code to the project, we encourage you to fork the repository, make your changes, and submit a pull request. Follow these steps to contribute code:
     - Fork the repository to your GitHub account.
     - Create a new branch for your changes based on the `main` branch.
     - Make your desired changes to the codebase.
     - Test your changes thoroughly to ensure they do not introduce any new issues.
     - Commit your changes with descriptive commit messages.
     - Push your changes to your forked repository.
     - Open a pull request to the original repository, clearly explaining the purpose of your changes.

4. **Code Style and Guidelines:**
   - Adhere to the coding style and guidelines used in the project. Familiarize yourself with the existing codebase and maintain consistency with naming conventions, code structure, and formatting.

5. **Review Process:**
   - Your pull requests will undergo a review process by project maintainers. Please be patient during this review process, and be prepared to address any feedback or suggestions for improvement.

6. **Collaboration and Communication:**
   - Feel free to engage with other contributors and project maintainers through GitHub discussions, comments on pull requests, or other communication channels. Collaboration and constructive feedback are key to the success of the project.

Thank you for considering contributing to the Injera Mold Detection App! Your contributions play a valuable role in improving the app for all users.



Contact:

For support or inquiries, you can reach out to us through the following channels:

- Email: [abrham.wendmeneh.a@gmail.com](mailto:abrham.wendmeneh.a@gmail.com)
- GitHub: [AbrhamWendmeneh](https://github.com//AbrhamWendmeneh)

- Email: [fraolmulugeta17@gmail.com](mailto:fraolmulugeta17@gmail.com)
- GitHub: [Fraol7](https://github.com//Fraol7)

- Email: [kidusshun@gmail.com](mailto:kidusshun@gmail.com)
- GitHub: [kidusshun](https://github.com/kidusshun)

We are here to assist you and address any questions or concerns you may have regarding the Injera Mold Detection App. Don't hesitate to reach out!



Credits:

We would like to extend our appreciation to the developers of the YOLO (You Only Look Once) object detection method, which played a crucial role in the development of our Injera Mold Detection App. YOLO is a state-of-the-art deep learning-based object detection algorithm that offers efficient and accurate real-time object detection in images. Its robustness and performance have significantly contributed to the effectiveness of our app in detecting mold on injera images. We are grateful for the innovative work and contributions of the YOLO team, which have enabled us to deliver a reliable and valuable tool for our users.