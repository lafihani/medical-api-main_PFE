# Medical Hub – Suivi Patient

Projet complet de suivi patient : **API Laravel** (backend), **dashboard web Angular** (médecins/admin) et **application mobile Flutter** (patients). Toutes les parties communiquent via l’API REST.

---

## Structure du projet

```
medical-api/
├── app/                    # Backend Laravel (API REST)
├── angular-app/            # Frontend web Angular (médecins / admin)
├── flutter_patient_app/    # Application mobile Flutter (patients)
├── config/                 # Configuration Laravel
├── database/               # Migrations, seeders
├── routes/                 # Routes API
├── .env.example            # Exemple de variables d'environnement
└── README.md               # Ce fichier
```

- **Backend** : authentification JWT, CRUD patients/rapports/messages/alertes, upload photos pansement, logique d’alertes (température, douleur).
- **Dashboard web** : tableau de bord, patients, suivi patient, alertes, rapports, messages, profil.
- **App Flutter** : espace patient (suivi, photos, analyses, messages, observations du médecin).

Voir [ARCHITECTURE.md](ARCHITECTURE.md) pour les détails.

---

## Prérequis

- **PHP 8.1+** (backend)
- **Composer** (PHP)
- **Node.js 18+** (Angular)
- **Flutter SDK 3.0+** (app mobile, optionnel)
- **MySQL** (ou MariaDB) ou **PostgreSQL**

---

## 1. Backend Laravel (API)

### Installation

```bash
# À la racine du projet
composer install
```

### Configuration de la base de données

1. Créer une base de données (ex. `medical_hub`).

2. Copier le fichier d’environnement et renseigner les variables :

```bash
cp .env.example .env
php artisan key:generate
```

3. Modifier `.env` avec vos paramètres de base de données :

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=medical_hub
DB_USERNAME=root
DB_PASSWORD=votre_mot_de_passe
```

4. Lancer les migrations et le seeder (données de test) :

```bash
php artisan migrate
php artisan db:seed
```

### Lancer le serveur API

```bash
php artisan serve
```

L’API est disponible sur **http://localhost:8000**. Les endpoints sont préfixés par `/api`.

**Comptes de test (après seed)** : `doctor` / `password123`, `admin` / `password123`, ou un patient créé via l’inscription.

---

## 2. Dashboard web (Angular)

### Installation

```bash
cd angular-app
npm install
```

### Configuration

- URL de l’API : `angular-app/src/app/core/config/api.config.ts` (par défaut `http://localhost:8000/api`).
- CORS : le backend Laravel doit autoriser l’origine du frontend (`config/cors.php`).

### Lancer le dashboard

```bash
cd angular-app
npm start
```

Ouvrir **http://localhost:4200**. Se connecter avec un compte médecin ou admin (ex. `doctor` / `password123`).

### Build production

```bash
npm run build
```

Les fichiers sont générés dans `angular-app/dist/`.

---

## 3. Application mobile Flutter (Patient)

### Installation

```bash
cd flutter_patient_app
flutter pub get
```

### Configuration de l’URL de l’API

Modifier `flutter_patient_app/lib/config/api_config.dart` selon l’environnement :

- **Web (Chrome)** : `http://127.0.0.1:8000/api` (déjà configuré)
- **Émulateur Android** : `http://10.0.2.2:8000/api`
- **Appareil physique** : `http://IP_DE_VOTRE_MACHINE:8000/api`

### Lancer l’application

```bash
cd flutter_patient_app
flutter run
```

Choisir la cible (Chrome, Android, iOS) si demandé.

---

## Démarrer l’ensemble du projet

1. Démarrer l’API : à la racine, `php artisan serve`.
2. Démarrer le dashboard : dans `angular-app`, `npm start`.
3. (Optionnel) Démarrer l’app Flutter : dans `flutter_patient_app`, `flutter run -d chrome` (ou autre device).

---

## Tests

- **Backend** : `php artisan test` (à la racine).
- **Angular** : `cd angular-app && npm test`.

---

## Licence

MIT.
