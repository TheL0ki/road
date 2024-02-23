<?php

function getAllActiveUser() {
    global $mysqli;
    $select = "SELECT * FROM user WHERE active = 1 ORDER BY lastname ASC";
    $stmt = $mysqli->prepare($select);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $output = $stmt->get_result();

    while($row = $output->fetch_assoc()) {
        $result[] = $row;
    }
    
    return $result;
}

function getUsersFromTeam($team) {
    global $mysqli;
    $select = "SELECT * FROM user WHERE active = 1 AND team = ? ORDER BY lastname ASC";
    $stmt = $mysqli->prepare($select);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('s', $team);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $output = $stmt->get_result();

    while($row = $output->fetch_assoc()) {
        $result[] = $row;
    }
    
    return $result;
}

function getUser($id) {
    global $mysqli;
    $select = "SELECT * FROM user WHERE id = ?";
    $stmt = $mysqli->prepare($select);
    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('s', $id);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }
    
    $result = $stmt->get_result()->fetch_assoc();
    
    return $result;
}

function getSchedule($id, $month, $year) {
    global $mysqli;
    $select = "SELECT day, shift, homeOffice FROM schedule WHERE user = ? AND month = ? AND year = ?";
    $stmt = $mysqli->prepare($select);
    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('sss', $id, $month, $year);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }
    
    $output = $stmt->get_result();

    $result = NULL;
    $returnValue = array();
    if($output != NULL) {
        while($row = $output->fetch_assoc()) {
            $result[$row['day']] = array(
                'shift' => $row['shift'],
                'homeOffice' => $row['homeOffice']
            );
        }
    }
    
    if($result != NULL) {
        foreach($result as $key => $shift) {
            $displayName = getShiftName($shift['shift']);
            $returnValue[$key] = array(
                'shift' => $shift,
                'display' => $displayName['display'],
                'name' => $displayName['name'],
                'color' => $displayName['color'],
                'homeOffice' => $shift['homeOffice']
            );
        }
    } else {
        $returnValue = array();
    }

    return $returnValue;
}

function getShifts() {
    global $mysqli;
    $select = "SELECT * FROM shifts WHERE active = 1";
    $stmt = $mysqli->prepare($select);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $output = $stmt->get_result();
    $result = array();
    while($row = $output->fetch_assoc()) {
        $result[$row['id']] = $row;
    }
    
    return $result;
}

function getShiftName($id) {
    global $mysqli;
    $select = "SELECT display, name, color FROM shifts WHERE id = ?";
    $stmt = $mysqli->prepare($select);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('s', $id);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $result = $stmt->get_result()->fetch_assoc();

    return $result;
}

function checkShift($year, $month, $day, $user) {
    global $mysqli;
    $select = "SELECT * FROM schedule WHERE user = ? AND year = ? AND month = ? and day = ?";
    $stmt = $mysqli->prepare($select);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('ssss', $user, $year, $month, $day);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $result = $stmt->get_result()->fetch_assoc();

    if($result != NULL) {
        return $result;
    } else {
        return FALSE;
    }
}

function saveShift($year, $month, $day, $user, $shift, $ho) {
    global $mysqli;
    $insert = "INSERT INTO schedule (user, month, year, shift, day, homeOffice) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $mysqli->prepare($insert);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('ssssss', $user, $month, $year, $shift, $day, $ho);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    return TRUE;
}

function updateShift($year, $month, $day, $user, $shift, $ho) {
    global $mysqli;
    $update = "UPDATE schedule SET shift = ?, homeOffice = ? WHERE user = ? AND year = ? AND month = ? AND day = ?";
    $stmt = $mysqli->prepare($update);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('ssssss', $shift, $ho, $user, $year, $month, $day);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }
    return TRUE;
}

function deleteShift($year, $month, $day, $user) {
    global $mysqli;
    $delete = "DELETE FROM schedule WHERE user = ? AND year = ? AND month = ? and day = ?";
    $stmt = $mysqli->prepare($delete);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('ssss', $user, $year, $month, $day);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    return TRUE;
}

function getTeams() {
    global $mysqli;
    $select = 'SELECT * FROM teams';
    $stmt = $mysqli->prepare($select);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $output = $stmt->get_result();

    while($row = $output->fetch_assoc()) {
        $result[] = $row;
    }

    $teams = array();

    foreach($result as $team) {
        $teams[$team['id']] = $team;
    }
    
    return $teams;
}

function createUser($firstname, $lastname, $email, $pwd, $team, $model, $admin) {
    global $mysqli;
    $insert = "INSERT INTO user (firstname, lastname, email, pwd, team, model, active, admin) VALUES (?,?,?,?,?,?,?,?)";
    $stmt = $mysqli->prepare($insert);
    $active = 1;
    $hashed = password_hash($pwd, PASSWORD_BCRYPT);

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('ssssssss', $firstname, $lastname, $email, $hashed, $team, $model, $active, $admin);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    return TRUE;
}

function loginUser($email, $pwd) {
    global $mysqli;
    $select = "SELECT * FROM user WHERE email = ?";
    $stmt = $mysqli->prepare($select);
    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('s', $email);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $output = $stmt->get_result();
    $result = $output->fetch_assoc();
    
    if(isset($result) AND $result != NULL) {
        if(password_verify($pwd, $result["pwd"])) {
            return $result;
        } else {
            return FALSE;
        }
    } else {
        return FALSE;
    }    
}

function changeSettings($userID, $email) {
    global $mysqli;
    $update = 'UPDATE user SET email = ? WHERE id = ?';
    $stmt = $mysqli->prepare($update);
    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }

    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('ss', $email, $userID);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    return TRUE;
}

function changePWD($oldPWD, $newPWD, $userID) {
    global $mysqli;
    $select = 'SELECT pwd FROM user WHERE id = ?';

    $stmt = $mysqli->prepare($select);
    if($stmt === FALSE) {
        return 'prepare error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->bind_param('s', $userID);
    if($rc === FALSE) {
        return 'bind error: '.htmlspecialchars($mysqli->error);
    }
    
    $rc = $stmt->execute();
    if($rc === FALSE) {
        return 'execute error: '.htmlspecialchars($mysqli->error);
    }

    $output = $stmt->get_result();
    $result = $output->fetch_assoc();

    if(password_verify($oldPWD, $result['pwd'])) {
        $insertPWD = password_hash($newPWD, PASSWORD_BCRYPT);
        $update = 'UPDATE user SET pwd = ? WHERE id = ?';
        $stmt = $mysqli->prepare($update);
        if($stmt === FALSE) {
            return 'prepare error: '.htmlspecialchars($mysqli->error);
        }
        
        $rc = $stmt->bind_param('ss', $insertPWD, $userID);
        if($rc === FALSE) {
            return 'bind error: '.htmlspecialchars($mysqli->error);
        }
        
        $rc = $stmt->execute();
        if($rc === FALSE) {
            return 'execute error: '.htmlspecialchars($mysqli->error);
        }

        return TRUE;
    }
}