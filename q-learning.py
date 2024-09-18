import numpy as np
import random

# Define the environment: tasks and availability
tasks = [
    {"name": "Complete Assignment", "priority": "High", "time_required": 3, "deadline": 1},  # Deadline in 1 day
    {"name": "Grocery Shopping", "priority": "Low", "time_required": 1, "deadline": 2},
    {"name": "Prepare Presentation", "priority": "Medium", "time_required": 2, "deadline": 3},
    {"name": "Workout", "priority": "Low", "time_required": 1, "deadline": 2}
]

availability = 5  # Number of time slots available (e.g., 5 hours of free time)

# Priority map to assign higher rewards to important tasks
priority_map = {"High": 10, "Medium": 5, "Low": 1}

# Q-Learning parameters
alpha = 0.1      # Learning rate
gamma = 0.9      # Discount factor
epsilon = 0.1    # Epsilon for exploration vs exploitation
episodes = 1000  # Number of training episodes

# Initialize Q-table: rows = task, columns = time slots
q_table = np.zeros((len(tasks), availability))

# Reward function
def reward(task, time_taken):
    priority = priority_map[task['priority']]
    deadline_reward = max(0, (task['deadline'] - time_taken))  # Reward if task completed before deadline
    return priority + deadline_reward  # Combined reward

# Choose action based on epsilon-greedy policy
def choose_action(state):
    if random.uniform(0, 1) < epsilon:  # Explore
        return random.choice(range(availability))
    else:  # Exploit
        return np.argmax(q_table[state])  # Choose action with highest Q-value

# Update Q-table based on the action taken
def q_learning_update(state, action, reward, next_state):
    old_value = q_table[state, action]
    next_max = np.max(q_table[next_state])
    
    # Q-Learning formula
    new_value = (1 - alpha) * old_value + alpha * (reward + gamma * next_max)
    q_table[state, action] = new_value

# Training loop
for episode in range(episodes):
    state = 0  # Start with the first task
    
    for time_slot in range(availability):
        action = choose_action(state)
        
        # Simulate taking action: scheduling a task
        task = tasks[state]
        task_time = time_slot  # Assign time slot
        
        # Calculate reward based on task priority and how well it meets deadlines
        task_reward = reward(task, task_time)
        
        # Move to the next task (next state)
        next_state = (state + 1) % len(tasks)
        
        # Update the Q-value for the current state-action pair
        q_learning_update(state, action, task_reward, next_state)
        
        # Transition to the next state
        state = next_state

# Display the learned Q-table (optimal scheduling decisions)
print("Learned Q-Table:")
print(q_table)

# After training, use the Q-table to make scheduling decisions
schedule = []
for i, task in enumerate(tasks):
    best_time_slot = np.argmax(q_table[i])  # Find the best time slot for this task
    schedule.append({"task": task["name"], "scheduled_time": best_time_slot})

print("\nOptimized Schedule:")
for s in schedule:
    print(f"Task: {s['task']}, Scheduled Time Slot: {s['scheduled_time']}")
