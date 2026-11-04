resource "google_sql_database_instance" "postgres" {
  name             = "postgres-demo"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = false
}
