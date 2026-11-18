namespace Auth.Seguridad
{
    public class RoutesDTO
    {
        public string Name { get; set; }
        public string Url { get; set; }
        public string PhysicalFile { get; set; }
        public bool IsAnonymous { get; set; } = false;
        public string[] IsInRol { get; set; } = null;
    }
}
