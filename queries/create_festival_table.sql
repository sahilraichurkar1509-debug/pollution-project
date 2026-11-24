-- 1. Remove the earlier draft of the table (it is empty)
DROP TABLE festival_dates;

-- 2. Create the table
CREATE TABLE festival_dates (
    festival      TEXT,
    festival_date DATE,
    day_label     TEXT,
    notes         TEXT,
    PRIMARY KEY (festival, festival_date)
);

-- 3. Insert the Diwali chains for 2023 and 2024
INSERT INTO festival_dates (festival, festival_date, day_label, notes)
VALUES
    -- Diwali 2023
    ('diwali', '2023-11-09', 'vasu_baras',            'Observed in Maharashtra and Gujarat'),
    ('diwali', '2023-11-10', 'dhanteras',             NULL),
    ('diwali', '2023-11-11', 'kali_chaudas',          'Choti Diwali in some calendars'),
    ('diwali', '2023-11-12', 'lakshmi_puja',          'Main Diwali night; Narak Chaturdashi falls on the same day'),
    ('diwali', '2023-11-13', 'diwali_snan_amavasya',  'Listed in some calendars only'),
    ('diwali', '2023-11-14', 'govardhan_puja_padwa',  'Bali Pratipada in Maharashtra; some sources also list Bhai Dooj here'),
    ('diwali', '2023-11-15', 'bhau_beej',             'Bhai Dooj'),

    -- Diwali 2024
    ('diwali', '2024-10-28', 'vasu_baras',            'Observed in Maharashtra'),
    ('diwali', '2024-10-29', 'dhanteras',             NULL),
    ('diwali', '2024-10-30', 'kali_chaudas',          NULL),
    ('diwali', '2024-10-31', 'narak_chaturdashi',     'Several sources also give Lakshmi Puja on this date'),
    ('diwali', '2024-11-01', 'lakshmi_puja',          'Sources differ: Amavasya spans 31 Oct and 1 Nov'),
    ('diwali', '2024-11-02', 'govardhan_puja_padwa',  NULL),
    ('diwali', '2024-11-03', 'bhau_beej',             'Bhai Dooj');

-- 4. Check it
SELECT * FROM festival_dates ORDER BY festival_date;
