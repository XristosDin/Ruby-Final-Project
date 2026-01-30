# REST API – Διαχείριση Εκκρεμοτήτων (Todo List)

Η παρούσα εφαρμογή αποτελεί ένα REST API που υλοποιήθηκε με Ruby on Rails και παρέχει λειτουργικότητα διαχείρισης λίστας εκκρεμοτήτων (todos) και επιμέρους στοιχείων (todo items).

Η εφαρμογή αναπτύχθηκε στο πλαίσιο εκπόνησης απαλλακτικής εργασίας εξαμήνου για το ακαδημαϊκό έτος 2025–2026.

---

## Τεχνολογίες

- Ruby on Rails
- Ruby 3+
- SQLite
- Devise (διαχείριση χρηστών)
- Token-based Authentication
- HTTPie (δοκιμή API)
- OpenAPI (Swagger)

---

## Απαιτήσεις Συστήματος

- Ruby εγκατεστημένο
- Rails εγκατεστημένο
- Bundler
- SQLite

---

## Εγκατάσταση

1. Κλωνοποίηση αποθετηρίου:
```bash
git clone <repository-url>.

2. Εγκατάσταση gems:

bundle install


3. Δημιουργία βάσης:

rails db:create
rails db:migrate


4. Εκκίνηση server:

rails server

Αυθεντικοποίηση

Η εφαρμογή χρησιμοποιεί αυθεντικοποίηση μέσω token.

Μετά από επιτυχημένο login, ο χρήστης λαμβάνει token, το οποίο πρέπει να αποστέλλεται σε κάθε αίτημα:

Authorization: Token "Το αντίστοιχο ΤΟΚΕΝ"

Βασικά Endpoints

POST /signup

POST /auth/login

GET /auth/logout

GET /todos

POST /todos

GET /todos/:id

PUT /todos/:id

DELETE /todos/:id

Δοκιμές

Όλα τα endpoints δοκιμάστηκαν μέσω του εργαλείου HTTPie από τη γραμμή εντολών.

Τεκμηρίωση API

Η πλήρης τεκμηρίωση του API περιλαμβάνεται στο αρχείο openapi.yaml καθώς και στο συνοδευτικό εγχειρίδιο χρήσης (PDF).