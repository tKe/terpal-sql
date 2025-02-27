CREATE TABLE Person(
    id INTEGER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    age INT
);

CREATE TABLE Address(
    ownerId INT,
    street VARCHAR(255),
    zip INT
);

CREATE TABLE Product(
  description VARCHAR(255),
  id INTEGER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  sku NUMBER
);

CREATE TABLE TimeEntity(
    sqlDate        DATE,                     -- java.sql.Date
    -- Oracle has no TIME type
    sqlTime        TIMESTAMP,                     -- java.sql.Time
    sqlTimestamp   TIMESTAMP,                -- java.sql.Timestamp
    timeLocalDate      DATE,                     -- java.time.LocalDate
    timeLocalTime      TIMESTAMP,                     -- java.time.LocalTime
    timeLocalDateTime  TIMESTAMP,                -- java.time.LocalDateTime
    timeZonedDateTime  TIMESTAMP WITH TIME ZONE, -- java.time.ZonedDateTime
    timeInstant        TIMESTAMP WITH TIME ZONE, -- java.time.Instant
    timeOffsetTime     TIMESTAMP WITH TIME ZONE,      -- java.time.OffsetTime
    timeOffsetDateTime TIMESTAMP WITH TIME ZONE  -- java.time.OffsetDateTime
);

CREATE TABLE EncodingTestEntity(
  v1 VARCHAR(255),
  v2 DECIMAL(5,2),
  v3 SMALLINT,
  v4 SMALLINT,
  v5 SMALLINT,
  v6 INTEGER,
  v7 NUMBER,
  v8 FLOAT,
  v9 DOUBLE PRECISION,
  v10 BLOB,
  v11 TIMESTAMP,
  v12 VARCHAR(255),
  v13 DATE,
  v14 VARCHAR(36),
  o1 VARCHAR(255),
  o2 DECIMAL(5,2),
  o3 SMALLINT,
  o4 SMALLINT,
  o5 SMALLINT,
  o6 INTEGER,
  o7 NUMBER,
  o8 FLOAT,
  o9 DOUBLE PRECISION,
  o10 BLOB,
  o11 TIMESTAMP,
  o12 VARCHAR(255),
  o13 DATE,
  o14 VARCHAR(36)
);
