# Database Performance Monitoring

## Monitoring Tools
- **EXPLAIN / EXPLAIN ANALYZE**: Used to analyze query execution plans.
- **SHOW PROFILE** (MySQL): Used to check query execution steps and resource usage.

## Queries Monitored
Example: Retrieve bookings with user and property details.

```sql
EXPLAIN ANALYZE
SELECT b.id, b.date, u.username, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.date >= '2023-01-01' AND u.status = 'active';
