# Health.AI
Welcome to HealthAI! This app is designed to help you improve your sleep quality and overall well-being. It integrates your calendar, uses AI to help plan your daily schedule, and gamifies sleep habits for motivation. Additionally, it offers a smart to-do list and journaling feature for holistic well-being.

## Features
- Sleep Tracking: Track your sleep duration, quality, and consistency to optimize rest.
- NTULearn Calendar Integration: Automatically sync your calendar with the app to help balance your academic and personal commitments.
- AI-Powered Scheduling: Our AI analyzes your calendar and personal goals to suggest the best times for sleep, study, and relaxation.
- Gamification: Earn streaks for hitting sleep goals and maintaining consistent rest habits. Compete with friends and win rewards from sponsors.
- Smart To-Do List: Manage your tasks effectively, with automatic prioritization based on deadlines, task importance, and available time.
- Journaling Feature: Keep track of your daily reflections and emotional well-being with our integrated journaling tool.

## Q-Learning for AI-Driven Scheduling
HealthAI leverages Q-learning, a type of reinforcement learning algorithm, to optimize users' sleep schedules and daily routines. The AI learns from users' actions (e.g., sleeping late, completing tasks, maintaining streaks) and improves its scheduling recommendations over time.

### How Q-Learning Works in HealthAI
1. State: The current state is defined by the user's schedule, habits, and sleep patterns (e.g., how many hours the user slept the night before, upcoming tasks, deadlines).

2. Action: Actions are recommendations the AI can make, such as suggesting a new sleep time, rescheduling a task, or sending a reminder for a break.

3. Reward: The AI receives rewards based on the user’s behavior. For instance, if the user follows the recommended sleep schedule and achieves a good sleep score, the AI receives a positive reward. Conversely, ignoring sleep recommendations or consistently being sleep-deprived incurs a negative reward.

4. Q-Table: The AI uses a Q-table to store the expected rewards for each action in each state. Over time, by exploring different actions and observing the outcomes, the AI updates the Q-values to make better recommendations in the future.

5. Goal: The objective of the Q-learning algorithm is to maximize cumulative rewards, which in this case translates to improving the user's sleep quality, productivity, and overall well-being.

By using Q-learning, HealthAI adapts to the user's unique habits and schedules, providing personalized recommendations that improve over time as more data is collected.

## Tech Stack
- Frontend: React
- Backend: Django Rest Framework
- AI Scheduling: Python-based AI models
- Database: PostgreSQL
- Cloud Services: AWS (S3, Lambda), Kubernetes for container orchestration
- Integration: Google Calendar API, NTULearn API

Installation
Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/HealthAI.git
cd HealthAI
Install the required dependencies:

bash
Copy code
pip install -r requirements.txt
npm install
Run the development server:

bash
Copy code
python manage.py runserver
npm start
Visit http://localhost:3000 to view the app.

Contributions
We welcome contributions from the community! Please follow the contribution guidelines before submitting a pull request.

## License
This project is licensed under the MIT License.

## Contact
For any inquiries or feedback, please email us at support@healthai.com.

![Screenshot 2024-09-16 212806](https://github.com/user-attachments/assets/20fa449b-db5d-4c52-99c3-ffaf9d4c385c)
Currently the application has been published to the Google Play Store, although the app is still in development. We plan on expanding on the personal journaling and gamification style of the application. The AI model has not been finalized yet. It is now available in 2 languages: English and Chinese (simplified).

The link for the application in Google Play App Store can be accessed here: https://play.google.com/store/apps/details?id=com.health.ai 

The new version 3.0.0 is currently in review and waiting for full rollout, and has been deployed to 17 countries in the world. While there are some difficulties in trying to integrate NTULearn to our application, we can have other alternatives such as using Google Calendar into our application, where push notifications are displayed in mobile phones as well.

