# 💬 Talk to Data - AI SQL Data Analyst Assistant

An intelligent data analysis tool that converts natural language questions into SQL queries, visualizes results, and provides AI-generated insights.

![Demo](demo.gif)

## 🌟 Features

- **Natural Language to SQL**: Ask questions in plain English, get SQL queries
- **Smart Visualizations**: Automatic chart generation for suitable data
- **AI Insights**: Groq AI (Llama 3.3 70B) analyzes results and provides key findings
- **Interactive Tables**: Browse query results with clean UI
- **Sample Data Included**: Pre-loaded sales and customer data for testing
- **100% Free AI**: Groq API is completely free with unlimited requests

## 🛠️ Tech Stack

### Backend
- Python 3.11
- Flask (Web Framework)
- PyMySQL (Database Connection)
- Groq AI - Llama 3.3 70B (Natural Language Processing)
- Pandas (Data Analysis)

### Frontend
- React 18
- Vite (Build Tool)
- Chart.js (Visualizations)
- Axios (HTTP Client)

### Database
- MySQL 8.0

## 📋 Prerequisites

- Python 3.11+
- Node.js 18+
- MySQL 8.0+
- Groq API Key - **100% FREE** ([Get one here](https://console.groq.com/))

## 🚀 Local Setup

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd talk-to-data
```

### 2. Setup Database

```bash
# Login to MySQL
mysql -u root -p

# Run the database setup script
mysql -u root -p < backend/database.sql
```

### 3. Setup Backend

```bash
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On Mac/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create .env file
cp .env.example .env

# Edit .env and add your configuration:
# - DB_HOST=localhost
# - DB_USER=root
# - DB_PASSWORD=your_password
# - DB_NAME=talk_to_data
# - ANTHROPIC_API_KEY=your_api_key_here

# Run the backend
python app.py
```

Backend will run on http://localhost:5000

### 4. Setup Frontend

```bash
cd ../frontend

# Install dependencies
npm install

# Create .env file (optional)
cp .env.example .env

# Run development server
npm run dev
```

Frontend will run on http://localhost:3000

## 🌐 Deployment

### Backend Deployment (Railway)

1. Create account at [Railway.app](https://railway.app)
2. Create new project
3. Add MySQL database service
4. Deploy from GitHub:
   - Select your repository
   - Set root directory to `/backend`
   - Add environment variables:
     - `ANTHROPIC_API_KEY`
     - `DB_HOST` (from Railway MySQL service)
     - `DB_USER` (from Railway MySQL service)
     - `DB_PASSWORD` (from Railway MySQL service)
     - `DB_NAME=talk_to_data`
5. Run database migration:
   - Connect to Railway MySQL
   - Execute `backend/database.sql`

### Frontend Deployment (Vercel)

1. Create account at [Vercel.com](https://vercel.com)
2. Import your repository
3. Configure:
   - Framework Preset: `Vite`
   - Root Directory: `frontend`
   - Build Command: `npm run build`
   - Output Directory: `dist`
4. Update `vercel.json`:
   - Replace `https://your-backend-url.railway.app` with your Railway backend URL
5. Deploy!

### Alternative: Render (Free Tier)

**Backend:**
1. Create [Render.com](https://render.com) account
2. New Web Service from Git
3. Settings:
   - Environment: Python 3
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `gunicorn app:app`
   - Root Directory: `backend`

**Database:**
1. Create PostgreSQL database on Render (or use Railway MySQL)
2. Add connection string to environment variables

## 📸 Demo

### Ask Natural Language Questions
![Query Example](docs/query.png)

### Get SQL Queries & Insights
![Results Example](docs/results.png)

### Visualize Data
![Chart Example](docs/chart.png)

## 💡 Example Questions

- "What are the top 5 products by revenue?"
- "Show me sales by region"
- "Which category has the highest sales?"
- "How many customers are from each country?"
- "What is the average price per category?"
- "Show me total revenue by month"
- "Which product sold the most units?"

## 🔧 Configuration

### Environment Variables

**Backend (.env):**
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=talk_to_data
ANTHROPIC_API_KEY=your_key_here
```

**Frontend (.env):**
```env
VITE_API_URL=/api
```

## 📁 Project Structure

```
talk-to-data/
├── backend/
│   ├── app.py              # Main Flask application
│   ├── requirements.txt    # Python dependencies
│   ├── database.sql        # Database schema & sample data
│   ├── .env.example        # Environment template
│   ├── Procfile           # Railway deployment
│   └── railway.json       # Railway config
├── frontend/
│   ├── src/
│   │   ├── App.jsx        # Main React component
│   │   ├── App.css        # Styles
│   │   ├── main.jsx       # Entry point
│   │   └── index.css      # Global styles
│   ├── index.html         # HTML template
│   ├── package.json       # Node dependencies
│   ├── vite.config.js     # Vite configuration
│   └── vercel.json        # Vercel deployment
└── README.md              # This file
```

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📝 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- [Groq](https://groq.com/) - Lightning-fast AI inference (100% FREE!)
- [Meta Llama 3.3](https://ai.meta.com/llama/) - Powerful language model
- [Chart.js](https://www.chartjs.org/) - Data visualization
- [Vite](https://vitejs.dev/) - Frontend tooling
- [Flask](https://flask.palletsprojects.com/) - Backend framework

## 📧 Contact

For questions or support, please open an issue on GitHub.

---

Made with ❤️ using Groq AI & Llama 3.3 70B
