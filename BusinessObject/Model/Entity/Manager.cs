﻿using System;
using System.Collections.Generic;

namespace BusinessObject.Model.Entity;

public partial class Manager
{
    public int Id { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Fullname { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Ssn { get; set; } = null!;

    public string Address { get; set; } = null!;

    public bool IsAdmin { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
